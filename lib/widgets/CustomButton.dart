import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onpressed,
      required this.text,
      this.background = Colors.purple,
      this.textColor = Colors.white});
  final VoidCallback onpressed;
  final String text;
  final Color background;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(500, 70),
          backgroundColor: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          side: const BorderSide(color: Colors.purple, width: 1.5)),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: textColor),
      ),
    );
  }
}
