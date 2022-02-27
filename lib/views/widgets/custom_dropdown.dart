import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String title;
  final List items;
  final String? value;
  final void Function(Object?) onChanged;
  const CustomDropDown(
      {Key? key,
      required this.title,
      required this.items,
      required this.onChanged,
      this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 7.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 7.0),
          Container(
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                value: value,
                isExpanded: true,
                items: items.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ],
      ),
    );
  }
}
