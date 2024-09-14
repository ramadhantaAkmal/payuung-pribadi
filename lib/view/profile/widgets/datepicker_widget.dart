import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatepickerWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  bool isRequired, readOnly;
  String hintText;
  DatepickerWidget({
    super.key,
    required this.controller,
    required this.label,
    this.isRequired = false,
    this.readOnly = false,
    this.hintText = "",
  });

  @override
  State<DatepickerWidget> createState() => _DatepickerWidgetState();
}

class _DatepickerWidgetState extends State<DatepickerWidget> {
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
        TextFormField(
          controller: widget.controller,
          readOnly: true,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            suffixIcon:
                const Icon(Icons.calendar_today_rounded, color: Colors.grey),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Colors.grey,
                fontWeight: FontWeight.w400),
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
                  if (value == null || value.isEmpty) {
                    return 'Kolom ini wajib diisi';
                  }
                  return null;
                }
              : null,
          onTap: () {
            selectDate(context);
          },
        ),
      ],
    );
  }

  Future<DateTime> selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2099),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(selected);
        widget.controller.text = formattedDate;

        //selectedDate = formattedDate;
      });
    }
    return selectedDate;
  }
}
