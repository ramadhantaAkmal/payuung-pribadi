import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final String label;
  bool isRequired, readOnly;
  String hintText;
  final List<String> dropdownField;
  String? value;
  final ValueChanged<String?>? cbValue;
  DropdownWidget({
    super.key,
    required this.label,
    this.isRequired = false,
    this.readOnly = false,
    this.hintText = "",
    required this.dropdownField,
    this.value,
    this.cbValue,
  });

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  var listDropdown;
  @override
  void initState() {
    listDropdown = widget.dropdownField.isNotEmpty
        ? widget.dropdownField
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ))
            .toList()
        : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: widget.isRequired
              ? Row(
                  children: [
                    const Text(
                      "*",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(widget.label),
                  ],
                )
              : Text(widget.label),
        ),
        DropdownButtonFormField(
          value: widget.value,
          items: listDropdown,
          onChanged: widget.cbValue,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 6.0, vertical: 20),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(7.0))),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(7.0))),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(
                Radius.circular(7.0),
              ),
            ),
          ),
          validator: widget.isRequired
              ? (value) {
                  if (value == null) {
                    return 'Kolom ini wajib diisi';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }
}
