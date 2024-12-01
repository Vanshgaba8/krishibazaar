import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class GenericTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final Icon prefixIcon;
  final FocusNode? nextFocusNode;
  final TextInputType keyboardType;

  const GenericTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    required this.prefixIcon,
    this.nextFocusNode,
    this.keyboardType = TextInputType.text, // Default to text input
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: Colors.green[100],
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.brown, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        floatingLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 101, 67, 33),
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 101, 67, 33), width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onFieldSubmitted: (value) {
        if (nextFocusNode != null) {
          Utils.fieldFocusChange(context, focusNode, nextFocusNode!);
        }
      },
    );
  }
}
