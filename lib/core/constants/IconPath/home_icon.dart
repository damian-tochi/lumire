import 'package:flutter/cupertino.dart';

class HomeIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();


    // Path number 1


    paint.color = Color(0xff1C274C);
    path = Path();
    path.lineTo(size.width * 0.44, size.height * 0.72);
    path.cubicTo(size.width * 0.42, size.height * 0.7, size.width * 0.4, size.height * 0.71, size.width * 0.39, size.height * 0.72);
    path.cubicTo(size.width * 0.38, size.height * 0.74, size.width * 0.38, size.height * 0.76, size.width * 0.4, size.height * 0.77);
    path.cubicTo(size.width * 0.44, size.height * 0.81, size.width / 2, size.height * 0.83, size.width * 0.56, size.height * 0.83);
    path.cubicTo(size.width * 0.62, size.height * 0.83, size.width * 0.67, size.height * 0.81, size.width * 0.72, size.height * 0.77);
    path.cubicTo(size.width * 0.73, size.height * 0.76, size.width * 0.74, size.height * 0.74, size.width * 0.73, size.height * 0.72);
    path.cubicTo(size.width * 0.71, size.height * 0.71, size.width * 0.69, size.height * 0.7, size.width * 0.68, size.height * 0.72);
    path.cubicTo(size.width * 0.64, size.height * 0.74, size.width * 0.6, size.height * 0.76, size.width * 0.56, size.height * 0.76);
    path.cubicTo(size.width * 0.51, size.height * 0.76, size.width * 0.47, size.height * 0.74, size.width * 0.44, size.height * 0.72);
    path.cubicTo(size.width * 0.44, size.height * 0.72, size.width * 0.44, size.height * 0.72, size.width * 0.44, size.height * 0.72);
    canvas.drawPath(path, paint);


    // Path number 2


    paint.color = Color(0xff1C274C);
    path = Path();
    path.lineTo(size.width * 0.56, size.height * 0.06);
    path.cubicTo(size.width * 0.52, size.height * 0.06, size.width * 0.49, size.height * 0.07, size.width * 0.46, size.height * 0.08);
    path.cubicTo(size.width * 0.43, size.height * 0.1, size.width * 0.39, size.height * 0.12, size.width * 0.34, size.height * 0.15);
    path.cubicTo(size.width * 0.34, size.height * 0.15, size.width * 0.27, size.height * 0.19, size.width * 0.27, size.height * 0.19);
    path.cubicTo(size.width * 0.22, size.height * 0.22, size.width * 0.18, size.height * 0.24, size.width * 0.15, size.height * 0.27);
    path.cubicTo(size.width * 0.12, size.height * 0.29, size.width * 0.09, size.height * 0.32, size.width * 0.08, size.height * 0.35);
    path.cubicTo(size.width * 0.06, size.height * 0.38, size.width * 0.06, size.height * 0.42, size.width * 0.06, size.height * 0.46);
    path.cubicTo(size.width * 0.06, size.height / 2, size.width * 0.07, size.height * 0.55, size.width * 0.08, size.height * 0.61);
    path.cubicTo(size.width * 0.08, size.height * 0.61, size.width * 0.09, size.height * 0.7, size.width * 0.09, size.height * 0.7);
    path.cubicTo(size.width * 0.1, size.height * 0.78, size.width * 0.11, size.height * 0.84, size.width * 0.12, size.height * 0.89);
    path.cubicTo(size.width * 0.14, size.height * 0.93, size.width * 0.15, size.height * 0.97, size.width * 0.19, size.height);
    path.cubicTo(size.width * 0.22, size.height * 1.03, size.width * 0.26, size.height * 1.05, size.width * 0.32, size.height * 1.05);
    path.cubicTo(size.width * 0.36, size.height * 1.06, size.width * 0.43, size.height * 1.06, size.width / 2, size.height * 1.06);
    path.cubicTo(size.width / 2, size.height * 1.06, size.width * 0.61, size.height * 1.06, size.width * 0.61, size.height * 1.06);
    path.cubicTo(size.width * 0.69, size.height * 1.06, size.width * 0.75, size.height * 1.06, size.width * 0.8, size.height * 1.05);
    path.cubicTo(size.width * 0.85, size.height * 1.05, size.width * 0.89, size.height * 1.03, size.width * 0.93, size.height);
    path.cubicTo(size.width * 0.96, size.height * 0.97, size.width * 0.98, size.height * 0.93, size.width, size.height * 0.89);
    path.cubicTo(size.width, size.height * 0.84, size.width * 1.02, size.height * 0.78, size.width * 1.03, size.height * 0.7);
    path.cubicTo(size.width * 1.03, size.height * 0.7, size.width * 1.04, size.height * 0.61, size.width * 1.04, size.height * 0.61);
    path.cubicTo(size.width * 1.05, size.height * 0.55, size.width * 1.06, size.height / 2, size.width * 1.06, size.height * 0.46);
    path.cubicTo(size.width * 1.06, size.height * 0.42, size.width * 1.05, size.height * 0.38, size.width * 1.04, size.height * 0.35);
    path.cubicTo(size.width * 1.02, size.height * 0.32, size.width, size.height * 0.29, size.width * 0.97, size.height * 0.27);
    path.cubicTo(size.width * 0.94, size.height * 0.24, size.width * 0.89, size.height * 0.22, size.width * 0.84, size.height * 0.19);
    path.cubicTo(size.width * 0.84, size.height * 0.19, size.width * 0.77, size.height * 0.15, size.width * 0.77, size.height * 0.15);
    path.cubicTo(size.width * 0.73, size.height * 0.12, size.width * 0.69, size.height * 0.1, size.width * 0.66, size.height * 0.08);
    path.cubicTo(size.width * 0.62, size.height * 0.07, size.width * 0.59, size.height * 0.06, size.width * 0.56, size.height * 0.06);
    path.cubicTo(size.width * 0.56, size.height * 0.06, size.width * 0.56, size.height * 0.06, size.width * 0.56, size.height * 0.06);
    path.lineTo(size.width * 0.38, size.height / 5);
    path.cubicTo(size.width * 0.43, size.height * 0.18, size.width * 0.46, size.height * 0.16, size.width * 0.49, size.height * 0.15);
    path.cubicTo(size.width * 0.52, size.height * 0.13, size.width * 0.54, size.height * 0.13, size.width * 0.56, size.height * 0.13);
    path.cubicTo(size.width * 0.58, size.height * 0.13, size.width * 0.6, size.height * 0.13, size.width * 0.63, size.height * 0.15);
    path.cubicTo(size.width * 0.66, size.height * 0.16, size.width * 0.69, size.height * 0.18, size.width * 0.74, size.height / 5);
    path.cubicTo(size.width * 0.74, size.height / 5, size.width * 0.8, size.height / 4, size.width * 0.8, size.height / 4);
    path.cubicTo(size.width * 0.86, size.height * 0.28, size.width * 0.9, size.height * 0.3, size.width * 0.92, size.height * 0.32);
    path.cubicTo(size.width * 0.95, size.height * 0.34, size.width * 0.97, size.height * 0.36, size.width * 0.98, size.height * 0.38);
    path.cubicTo(size.width, size.height * 0.4, size.width, size.height * 0.42, size.width, size.height * 0.46);
    path.cubicTo(size.width, size.height * 0.49, size.width * 0.98, size.height * 0.54, size.width * 0.97, size.height * 0.6);
    path.cubicTo(size.width * 0.97, size.height * 0.6, size.width * 0.96, size.height * 0.69, size.width * 0.96, size.height * 0.69);
    path.cubicTo(size.width * 0.95, size.height * 0.77, size.width * 0.94, size.height * 0.82, size.width * 0.93, size.height * 0.87);
    path.cubicTo(size.width * 0.92, size.height * 0.91, size.width * 0.9, size.height * 0.93, size.width * 0.88, size.height * 0.95);
    path.cubicTo(size.width * 0.86, size.height * 0.97, size.width * 0.84, size.height * 0.98, size.width * 0.79, size.height * 0.98);
    path.cubicTo(size.width * 0.75, size.height, size.width * 0.69, size.height, size.width * 0.61, size.height);
    path.cubicTo(size.width * 0.61, size.height, size.width * 0.51, size.height, size.width * 0.51, size.height);
    path.cubicTo(size.width * 0.43, size.height, size.width * 0.37, size.height, size.width * 0.32, size.height * 0.98);
    path.cubicTo(size.width * 0.28, size.height * 0.98, size.width / 4, size.height * 0.97, size.width * 0.23, size.height * 0.95);
    path.cubicTo(size.width / 5, size.height * 0.93, size.width / 5, size.height * 0.91, size.width * 0.19, size.height * 0.87);
    path.cubicTo(size.width * 0.18, size.height * 0.82, size.width * 0.17, size.height * 0.77, size.width * 0.16, size.height * 0.69);
    path.cubicTo(size.width * 0.16, size.height * 0.69, size.width * 0.14, size.height * 0.6, size.width * 0.14, size.height * 0.6);
    path.cubicTo(size.width * 0.14, size.height * 0.54, size.width * 0.13, size.height * 0.49, size.width * 0.13, size.height * 0.46);
    path.cubicTo(size.width * 0.13, size.height * 0.42, size.width * 0.13, size.height * 0.4, size.width * 0.14, size.height * 0.38);
    path.cubicTo(size.width * 0.15, size.height * 0.36, size.width * 0.16, size.height * 0.34, size.width * 0.19, size.height * 0.32);
    path.cubicTo(size.width * 0.22, size.height * 0.3, size.width * 0.26, size.height * 0.28, size.width * 0.31, size.height / 4);
    path.cubicTo(size.width * 0.31, size.height / 4, size.width * 0.38, size.height / 5, size.width * 0.38, size.height / 5);
    path.cubicTo(size.width * 0.38, size.height / 5, size.width * 0.38, size.height / 5, size.width * 0.38, size.height / 5);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
