import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController editingController;
  final int? length;
  final List<TextInputFormatter>? format;
  final TextInputType? keyboard;
  const CustomTextField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.editingController,
      this.length,
      this.format,
      this.keyboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 7.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 7.0),
          TextField(
            maxLength: length,
            controller: editingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              hintText: hint,
            ),
            inputFormatters: format,
            keyboardType: keyboard ?? TextInputType.text,
          ),
        ],
      ),
    );
  }
}
