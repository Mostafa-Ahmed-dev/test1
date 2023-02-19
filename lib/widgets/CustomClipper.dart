import 'package:flutter/cupertino.dart';

class CustomClipperr extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width - 360, size.height - 50, size.width - 260, size.height - 30);
    path.quadraticBezierTo(
        size.width - 150, size.height, size.width, size.height - 20);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
