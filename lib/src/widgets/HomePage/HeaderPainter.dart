import 'package:assets_img/src/pages/Constant.dart';
import 'package:flutter/material.dart';

class HeaderCurvaPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    //Propiedades
    paint.color = kMoradoColor;
    //Que tipo de relleno queremos
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();

    //Dibujamos el path y el lapiz
    // path.moveTo(0, size.height * 0.4);
    // path.lineTo(size.width, size.height * 0.5);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    //Curvas
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.20, size.width, size.height * 0.30);
    // path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
