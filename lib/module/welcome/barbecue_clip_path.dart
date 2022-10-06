import 'package:flutter/cupertino.dart';

class BarbecueClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.1676875, size.height * 0.9694800);
    path0.quadraticBezierTo(size.width * 0.1920000, size.height * 0.9894000,
        size.width * 0.2176625, size.height * 0.9908600);
    path0.cubicTo(
        size.width * 0.4501875,
        size.height * 0.9829200,
        size.width * 0.7568500,
        size.height * 0.9087400,
        size.width * 0.8703000,
        size.height * 0.8318000);
    path0.cubicTo(
        size.width * 0.9009375,
        size.height * 0.7989400,
        size.width * 0.9124250,
        size.height * 0.7855600,
        size.width * 0.9134875,
        size.height * 0.7418600);
    path0.cubicTo(
        size.width * 0.9124250,
        size.height * 0.7005400,
        size.width * 0.8877125,
        size.height * 0.6608600,
        size.width * 0.8703000,
        size.height * 0.6409200);
    path0.cubicTo(
        size.width * 0.8296125,
        size.height * 0.5894800,
        size.width * 0.8147375,
        size.height * 0.5345000,
        size.width * 0.8407500,
        size.height * 0.4834400);
    path0.cubicTo(
        size.width * 0.8600250,
        size.height * 0.4417800,
        size.width * 0.9161000,
        size.height * 0.4214800,
        size.width * 0.9011625,
        size.height * 0.3502000);
    path0.cubicTo(
        size.width * 0.8579625,
        size.height * 0.2497400,
        size.width * 0.8803750,
        size.height * 0.1270000,
        size.width * 0.8331500,
        size.height * 0.1238000);
    path0.cubicTo(
        size.width * 0.7549375,
        size.height * 0.1099000,
        size.width * 0.7258625,
        size.height * 0.1289600,
        size.width * 0.7024875,
        size.height * 0.0491400);
    path0.cubicTo(
        size.width * 0.6926375,
        size.height * -0.0034200,
        size.width * 0.6687375,
        size.height * 0.0041600,
        size.width * 0.6593000,
        size.height * 0.0002800);
    path0.cubicTo(
        size.width * 0.4822125,
        size.height * 0.1513000,
        size.width * 0.3692375,
        size.height * 0.1052000,
        size.width * 0.2983875,
        size.height * 0.0793200);
    path0.cubicTo(
        size.width * 0.2383625,
        size.height * 0.0851600,
        size.width * 0.2190625,
        size.height * 0.1330600,
        size.width * 0.1884125,
        size.height * 0.1836000);
    path0.cubicTo(
        size.width * 0.1819875,
        size.height * 0.2126400,
        size.width * 0.1673875,
        size.height * 0.2633200,
        size.width * 0.1757500,
        size.height * 0.2909200);
    path0.cubicTo(
        size.width * 0.1643500,
        size.height * 0.3654800,
        size.width * 0.2025375,
        size.height * 0.4665400,
        size.width * 0.2076000,
        size.height * 0.5241400);
    path0.cubicTo(
        size.width * 0.2257750,
        size.height * 0.6212200,
        size.width * 0.1462500,
        size.height * 0.8148000,
        size.width * 0.1346250,
        size.height * 0.9114200);
    path0.quadraticBezierTo(size.width * 0.1365000, size.height * 0.9474000,
        size.width * 0.1676875, size.height * 0.9694800);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
