import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icondata,
    @required this.icondatasuff,
    this.textInputType = TextInputType.text,
    required this.obscureText,
    this.ontap,
  });
  final String label;
  final String hint;
  final IconData icondata;
  final IconData? icondatasuff;
  final TextInputType textInputType;
  final bool obscureText;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter the field';
        } else {
          return null;
        }
      },
      keyboardType: textInputType,
      style: const TextStyle(color: Colors.purple),
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        prefixIcon: Icon(icondata),
        prefixIconColor: Colors.purple,
        suffixIconColor: Colors.purple,
        suffixIcon: InkWell(onTap: ontap, child: Icon(icondatasuff)),
        label: Text(label),
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        hintText: hint,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
