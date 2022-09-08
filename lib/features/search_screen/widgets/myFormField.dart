import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final double? radius;
  final double? width;
  final IconData prefix;
  final String label;
  final ValueChanged<String>? onChanged;
  const MyFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.prefix,
    required this.label,
    this.radius,
    this.width,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
        ),
        prefixIcon: Icon(prefix),
        label: Text(
          label,
        ),
      ),
    );
  }
}
