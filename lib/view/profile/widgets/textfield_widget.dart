import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  bool isRequired, readOnly;
  String hintText;
  TextfieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.isRequired = false,
    this.readOnly = false,
    this.hintText = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: isRequired
              ? Row(
                  children: [
                    const Text(
                      "*",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(label),
                  ],
                )
              : Text(label),
        ),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.grey.shade300,
            filled: readOnly,
            hintStyle: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
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
          validator: isRequired
              ? (value) {
                  if (value == null || value.isEmpty) {
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
