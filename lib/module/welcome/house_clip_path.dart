import 'package:flutter/cupertino.dart';

class HouseClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.1568000, size.height * 0.5630000);
    path0.cubicTo(
        size.width * 0.1491500,
        size.height * 0.5989400,
        size.width * 0.1568000,
        size.height * 0.6419400,
        size.width * 0.1670500,
        size.height * 0.6901800);
    path0.cubicTo(
        size.width * 0.2067500,
        size.height * 0.7577200,
        size.width * 0.1939500,
        size.height * 0.8152400,
        size.width * 0.2003375,
        size.height * 0.9033600);
    path0.cubicTo(
        size.width * 0.2093375,
        size.height * 0.9422800,
        size.width * 0.2426500,
        size.height * 0.9463600,
        size.width * 0.2568000,
        size.height * 0.9607400);
    path0.cubicTo(
        size.width * 0.2906875,
        size.height * 0.9741000,
        size.width * 0.3355125,
        size.height * 0.9515200,
        size.width * 0.3618750,
        size.height * 0.9485000);
    path0.cubicTo(
        size.width * 0.5860500,
        size.height * 0.8971600,
        size.width * 0.7244625,
        size.height * 0.7659000,
        size.width * 0.8795125,
        size.height * 0.6613800);
    path0.cubicTo(
        size.width * 0.9236625,
        size.height * 0.5938200,
        size.width * 0.9044625,
        size.height * 0.5445800,
        size.width * 0.9127875,
        size.height * 0.5055800);
    path0.cubicTo(
        size.width * 0.9006375,
        size.height * 0.4614800,
        size.width * 0.8685750,
        size.height * 0.4471800,
        size.width * 0.8538875,
        size.height * 0.4277200);
    path0.cubicTo(
        size.width * 0.7929625,
        size.height * 0.4226600,
        size.width * 0.7174000,
        size.height * 0.4614800,
        size.width * 0.6719000,
        size.height * 0.4728400);
    path0.quadraticBezierTo(size.width * 0.6565125, size.height * 0.4614800,
        size.width * 0.6104250, size.height * 0.4277200);
    path0.lineTo(size.width * 0.5873125, size.height * 0.3334400);
    path0.quadraticBezierTo(size.width * 0.5956750, size.height * 0.1704000,
        size.width * 0.5693875, size.height * 0.1160600);
    path0.cubicTo(
        size.width * 0.5418625,
        size.height * 0.0699000,
        size.width * 0.5150125,
        size.height * 0.0709000,
        size.width * 0.5027625,
        size.height * 0.0792000);
    path0.cubicTo(
        size.width * 0.4752250,
        size.height * 0.0822600,
        size.width * 0.4514625,
        size.height * 0.0996000,
        size.width * 0.4361500,
        size.height * 0.1120200);
    path0.cubicTo(
        size.width * 0.2920250,
        size.height * 0.2052800,
        size.width * 0.2189250,
        size.height * 0.3795800,
        size.width * 0.1823875,
        size.height * 0.4850600);
    path0.cubicTo(
        size.width * 0.1728250,
        size.height * 0.5076400,
        size.width * 0.1817500,
        size.height * 0.4870600,
        size.width * 0.1568000,
        size.height * 0.5630000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
