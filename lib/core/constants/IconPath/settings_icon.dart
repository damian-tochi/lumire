import 'package:flutter/cupertino.dart';

import '../app_colors.dart';


class SettingsIcon extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();


    // Path number 1
    paint.color = AppColors.borderLight;
    path = Path();
    path.lineTo(size.width * 0.59, size.height * 0.38);
    path.cubicTo(size.width * 0.49, size.height * 0.38, size.width * 0.41, size.height * 0.46, size.width * 0.41, size.height * 0.56);
    path.cubicTo(size.width * 0.41, size.height * 0.65, size.width * 0.49, size.height * 0.73, size.width * 0.59, size.height * 0.73);
    path.cubicTo(size.width * 0.69, size.height * 0.73, size.width * 0.77, size.height * 0.65, size.width * 0.77, size.height * 0.56);
    path.cubicTo(size.width * 0.77, size.height * 0.46, size.width * 0.69, size.height * 0.38, size.width * 0.59, size.height * 0.38);
    path.cubicTo(size.width * 0.59, size.height * 0.38, size.width * 0.59, size.height * 0.38, size.width * 0.59, size.height * 0.38);
    path.lineTo(size.width * 0.48, size.height * 0.56);
    path.cubicTo(size.width * 0.48, size.height / 2, size.width * 0.53, size.height * 0.45, size.width * 0.59, size.height * 0.45);
    path.cubicTo(size.width * 0.65, size.height * 0.45, size.width * 0.7, size.height / 2, size.width * 0.7, size.height * 0.56);
    path.cubicTo(size.width * 0.7, size.height * 0.62, size.width * 0.65, size.height * 0.66, size.width * 0.59, size.height * 0.66);
    path.cubicTo(size.width * 0.53, size.height * 0.66, size.width * 0.48, size.height * 0.62, size.width * 0.48, size.height * 0.56);
    path.cubicTo(size.width * 0.48, size.height * 0.56, size.width * 0.48, size.height * 0.56, size.width * 0.48, size.height * 0.56);
    canvas.drawPath(path, paint);


    // Path number 2
    paint.color = AppColors.borderLight;
    path = Path();
    path.lineTo(size.width * 0.59, size.height * 0.06);
    path.cubicTo(size.width * 0.57, size.height * 0.06, size.width * 0.55, size.height * 0.06, size.width * 0.53, size.height * 0.06);
    path.cubicTo(size.width * 0.52, size.height * 0.06, size.width / 2, size.height * 0.06, size.width * 0.49, size.height * 0.07);
    path.cubicTo(size.width * 0.46, size.height * 0.08, size.width * 0.43, size.height * 0.11, size.width * 0.42, size.height * 0.14);
    path.cubicTo(size.width * 0.41, size.height * 0.15, size.width * 0.41, size.height * 0.17, size.width * 0.41, size.height * 0.19);
    path.cubicTo(size.width * 0.41, size.height / 5, size.width * 0.4, size.height * 0.22, size.width * 0.39, size.height * 0.22);
    path.cubicTo(size.width * 0.37, size.height * 0.23, size.width * 0.36, size.height * 0.23, size.width * 0.34, size.height * 0.22);
    path.cubicTo(size.width / 3, size.height / 5, size.width * 0.31, size.height / 5, size.width * 0.29, size.height / 5);
    path.cubicTo(size.width * 0.26, size.height / 5, size.width * 0.22, size.height / 5, size.width * 0.19, size.height * 0.23);
    path.cubicTo(size.width * 0.18, size.height * 0.24, size.width * 0.17, size.height / 4, size.width * 0.16, size.height * 0.26);
    path.cubicTo(size.width * 0.15, size.height * 0.27, size.width * 0.14, size.height * 0.29, size.width * 0.13, size.height * 0.31);
    path.cubicTo(size.width * 0.13, size.height * 0.31, size.width * 0.13, size.height * 0.31, size.width * 0.13, size.height * 0.31);
    path.cubicTo(size.width * 0.12, size.height / 3, size.width * 0.11, size.height * 0.34, size.width * 0.1, size.height * 0.35);
    path.cubicTo(size.width * 0.1, size.height * 0.37, size.width * 0.09, size.height * 0.38, size.width * 0.09, size.height * 0.4);
    path.cubicTo(size.width * 0.09, size.height * 0.43, size.width * 0.1, size.height * 0.46, size.width * 0.12, size.height * 0.49);
    path.cubicTo(size.width * 0.13, size.height / 2, size.width * 0.14, size.height * 0.51, size.width * 0.16, size.height * 0.52);
    path.cubicTo(size.width * 0.17, size.height * 0.53, size.width * 0.18, size.height * 0.55, size.width * 0.18, size.height * 0.56);
    path.cubicTo(size.width * 0.18, size.height * 0.57, size.width * 0.17, size.height * 0.58, size.width * 0.16, size.height * 0.59);
    path.cubicTo(size.width * 0.14, size.height * 0.6, size.width * 0.13, size.height * 0.61, size.width * 0.12, size.height * 0.63);
    path.cubicTo(size.width * 0.1, size.height * 0.65, size.width * 0.09, size.height * 0.69, size.width * 0.09, size.height * 0.72);
    path.cubicTo(size.width * 0.09, size.height * 0.74, size.width * 0.1, size.height * 0.75, size.width * 0.1, size.height * 0.76);
    path.cubicTo(size.width * 0.11, size.height * 0.77, size.width * 0.12, size.height * 0.79, size.width * 0.13, size.height * 0.81);
    path.cubicTo(size.width * 0.13, size.height * 0.81, size.width * 0.13, size.height * 0.81, size.width * 0.13, size.height * 0.81);
    path.cubicTo(size.width * 0.14, size.height * 0.83, size.width * 0.15, size.height * 0.84, size.width * 0.16, size.height * 0.85);
    path.cubicTo(size.width * 0.17, size.height * 0.87, size.width * 0.18, size.height * 0.88, size.width * 0.19, size.height * 0.89);
    path.cubicTo(size.width * 0.22, size.height * 0.91, size.width * 0.26, size.height * 0.92, size.width * 0.29, size.height * 0.91);
    path.cubicTo(size.width * 0.31, size.height * 0.91, size.width / 3, size.height * 0.9, size.width * 0.34, size.height * 0.89);
    path.cubicTo(size.width * 0.36, size.height * 0.89, size.width * 0.37, size.height * 0.89, size.width * 0.39, size.height * 0.89);
    path.cubicTo(size.width * 0.4, size.height * 0.9, size.width * 0.41, size.height * 0.91, size.width * 0.41, size.height * 0.93);
    path.cubicTo(size.width * 0.41, size.height * 0.95, size.width * 0.41, size.height * 0.96, size.width * 0.42, size.height * 0.98);
    path.cubicTo(size.width * 0.43, size.height, size.width * 0.46, size.height * 1.04, size.width * 0.49, size.height * 1.05);
    path.cubicTo(size.width / 2, size.height * 1.05, size.width * 0.52, size.height * 1.06, size.width * 0.53, size.height * 1.06);
    path.cubicTo(size.width * 0.55, size.height * 1.06, size.width * 0.57, size.height * 1.06, size.width * 0.59, size.height * 1.06);
    path.cubicTo(size.width * 0.59, size.height * 1.06, size.width * 0.59, size.height * 1.06, size.width * 0.59, size.height * 1.06);
    path.cubicTo(size.width * 0.61, size.height * 1.06, size.width * 0.63, size.height * 1.06, size.width * 0.65, size.height * 1.06);
    path.cubicTo(size.width * 0.66, size.height * 1.06, size.width * 0.68, size.height * 1.05, size.width * 0.69, size.height * 1.05);
    path.cubicTo(size.width * 0.72, size.height * 1.04, size.width * 0.75, size.height, size.width * 0.76, size.height * 0.98);
    path.cubicTo(size.width * 0.77, size.height * 0.96, size.width * 0.77, size.height * 0.95, size.width * 0.77, size.height * 0.93);
    path.cubicTo(size.width * 0.77, size.height * 0.91, size.width * 0.78, size.height * 0.9, size.width * 0.79, size.height * 0.89);
    path.cubicTo(size.width * 0.81, size.height * 0.89, size.width * 0.82, size.height * 0.89, size.width * 0.83, size.height * 0.89);
    path.cubicTo(size.width * 0.85, size.height * 0.9, size.width * 0.87, size.height * 0.91, size.width * 0.89, size.height * 0.91);
    path.cubicTo(size.width * 0.92, size.height * 0.92, size.width * 0.96, size.height * 0.91, size.width, size.height * 0.89);
    path.cubicTo(size.width, size.height * 0.88, size.width, size.height * 0.87, size.width * 1.02, size.height * 0.85);
    path.cubicTo(size.width * 1.03, size.height * 0.84, size.width * 1.04, size.height * 0.83, size.width * 1.05, size.height * 0.81);
    path.cubicTo(size.width * 1.05, size.height * 0.81, size.width * 1.05, size.height * 0.81, size.width * 1.05, size.height * 0.81);
    path.cubicTo(size.width * 1.06, size.height * 0.79, size.width * 1.07, size.height * 0.77, size.width * 1.07, size.height * 0.76);
    path.cubicTo(size.width * 1.08, size.height * 0.75, size.width * 1.09, size.height * 0.74, size.width * 1.09, size.height * 0.72);
    path.cubicTo(size.width * 1.09, size.height * 0.69, size.width * 1.08, size.height * 0.65, size.width * 1.06, size.height * 0.63);
    path.cubicTo(size.width * 1.05, size.height * 0.61, size.width * 1.04, size.height * 0.6, size.width * 1.02, size.height * 0.59);
    path.cubicTo(size.width, size.height * 0.58, size.width, size.height * 0.57, size.width, size.height * 0.56);
    path.cubicTo(size.width, size.height * 0.55, size.width, size.height * 0.53, size.width * 1.02, size.height * 0.52);
    path.cubicTo(size.width * 1.04, size.height * 0.51, size.width * 1.05, size.height / 2, size.width * 1.06, size.height * 0.49);
    path.cubicTo(size.width * 1.08, size.height * 0.46, size.width * 1.09, size.height * 0.43, size.width * 1.09, size.height * 0.4);
    path.cubicTo(size.width * 1.09, size.height * 0.38, size.width * 1.08, size.height * 0.37, size.width * 1.07, size.height * 0.35);
    path.cubicTo(size.width * 1.07, size.height * 0.34, size.width * 1.06, size.height / 3, size.width * 1.05, size.height * 0.31);
    path.cubicTo(size.width * 1.05, size.height * 0.31, size.width * 1.05, size.height * 0.31, size.width * 1.05, size.height * 0.31);
    path.cubicTo(size.width * 1.04, size.height * 0.29, size.width * 1.03, size.height * 0.27, size.width * 1.02, size.height * 0.26);
    path.cubicTo(size.width, size.height / 4, size.width, size.height * 0.24, size.width, size.height * 0.23);
    path.cubicTo(size.width * 0.96, size.height / 5, size.width * 0.92, size.height / 5, size.width * 0.89, size.height / 5);
    path.cubicTo(size.width * 0.87, size.height / 5, size.width * 0.85, size.height / 5, size.width * 0.83, size.height * 0.22);
    path.cubicTo(size.width * 0.82, size.height * 0.23, size.width * 0.81, size.height * 0.23, size.width * 0.79, size.height * 0.22);
    path.cubicTo(size.width * 0.78, size.height * 0.22, size.width * 0.77, size.height / 5, size.width * 0.77, size.height * 0.19);
    path.cubicTo(size.width * 0.77, size.height * 0.17, size.width * 0.77, size.height * 0.15, size.width * 0.76, size.height * 0.14);
    path.cubicTo(size.width * 0.75, size.height * 0.11, size.width * 0.72, size.height * 0.08, size.width * 0.69, size.height * 0.07);
    path.cubicTo(size.width * 0.68, size.height * 0.06, size.width * 0.66, size.height * 0.06, size.width * 0.65, size.height * 0.06);
    path.cubicTo(size.width * 0.63, size.height * 0.06, size.width * 0.61, size.height * 0.06, size.width * 0.59, size.height * 0.06);
    path.cubicTo(size.width * 0.59, size.height * 0.06, size.width * 0.59, size.height * 0.06, size.width * 0.59, size.height * 0.06);
    path.cubicTo(size.width * 0.59, size.height * 0.06, size.width * 0.59, size.height * 0.06, size.width * 0.59, size.height * 0.06);
    path.lineTo(size.width * 0.52, size.height * 0.13);
    path.cubicTo(size.width * 0.52, size.height * 0.13, size.width * 0.53, size.height * 0.13, size.width * 0.54, size.height * 0.13);
    path.cubicTo(size.width * 0.55, size.height * 0.13, size.width * 0.57, size.height * 0.13, size.width * 0.59, size.height * 0.13);
    path.cubicTo(size.width * 0.61, size.height * 0.13, size.width * 0.63, size.height * 0.13, size.width * 0.64, size.height * 0.13);
    path.cubicTo(size.width * 0.65, size.height * 0.13, size.width * 0.66, size.height * 0.13, size.width * 0.66, size.height * 0.13);
    path.cubicTo(size.width * 0.68, size.height * 0.14, size.width * 0.69, size.height * 0.15, size.width * 0.7, size.height * 0.16);
    path.cubicTo(size.width * 0.7, size.height * 0.17, size.width * 0.7, size.height * 0.18, size.width * 0.7, size.height * 0.19);
    path.cubicTo(size.width * 0.7, size.height * 0.23, size.width * 0.72, size.height * 0.26, size.width * 0.76, size.height * 0.28);
    path.cubicTo(size.width * 0.79, size.height * 0.3, size.width * 0.83, size.height * 0.3, size.width * 0.87, size.height * 0.28);
    path.cubicTo(size.width * 0.88, size.height * 0.28, size.width * 0.89, size.height * 0.27, size.width * 0.9, size.height * 0.27);
    path.cubicTo(size.width * 0.91, size.height * 0.27, size.width * 0.93, size.height * 0.28, size.width * 0.94, size.height * 0.29);
    path.cubicTo(size.width * 0.95, size.height * 0.29, size.width * 0.95, size.height * 0.29, size.width * 0.96, size.height * 0.3);
    path.cubicTo(size.width * 0.96, size.height * 0.31, size.width * 0.97, size.height * 0.32, size.width * 0.98, size.height * 0.34);
    path.cubicTo(size.width, size.height * 0.36, size.width, size.height * 0.38, size.width, size.height * 0.39);
    path.cubicTo(size.width, size.height * 0.4, size.width, size.height * 0.4, size.width * 1.02, size.height * 0.4);
    path.cubicTo(size.width * 1.02, size.height * 0.42, size.width, size.height * 0.44, size.width, size.height * 0.45);
    path.cubicTo(size.width, size.height * 0.45, size.width, size.height * 0.46, size.width * 0.98, size.height * 0.47);
    path.cubicTo(size.width * 0.95, size.height * 0.48, size.width * 0.92, size.height * 0.52, size.width * 0.92, size.height * 0.56);
    path.cubicTo(size.width * 0.92, size.height * 0.6, size.width * 0.95, size.height * 0.63, size.width * 0.98, size.height * 0.65);
    path.cubicTo(size.width, size.height * 0.66, size.width, size.height * 0.66, size.width, size.height * 0.67);
    path.cubicTo(size.width, size.height * 0.68, size.width * 1.02, size.height * 0.7, size.width * 1.02, size.height * 0.71);
    path.cubicTo(size.width, size.height * 0.72, size.width, size.height * 0.72, size.width, size.height * 0.73);
    path.cubicTo(size.width, size.height * 0.74, size.width, size.height * 0.75, size.width * 0.98, size.height * 0.77);
    path.cubicTo(size.width * 0.97, size.height * 0.79, size.width * 0.96, size.height * 0.81, size.width * 0.96, size.height * 0.81);
    path.cubicTo(size.width * 0.95, size.height * 0.82, size.width * 0.95, size.height * 0.83, size.width * 0.94, size.height * 0.83);
    path.cubicTo(size.width * 0.93, size.height * 0.84, size.width * 0.91, size.height * 0.84, size.width * 0.9, size.height * 0.84);
    path.cubicTo(size.width * 0.89, size.height * 0.84, size.width * 0.88, size.height * 0.84, size.width * 0.87, size.height * 0.83);
    path.cubicTo(size.width * 0.83, size.height * 0.81, size.width * 0.79, size.height * 0.81, size.width * 0.76, size.height * 0.83);
    path.cubicTo(size.width * 0.72, size.height * 0.85, size.width * 0.7, size.height * 0.89, size.width * 0.7, size.height * 0.92);
    path.cubicTo(size.width * 0.7, size.height * 0.94, size.width * 0.7, size.height * 0.95, size.width * 0.7, size.height * 0.95);
    path.cubicTo(size.width * 0.69, size.height * 0.97, size.width * 0.68, size.height * 0.98, size.width * 0.66, size.height * 0.98);
    path.cubicTo(size.width * 0.66, size.height, size.width * 0.65, size.height, size.width * 0.64, size.height);
    path.cubicTo(size.width * 0.63, size.height, size.width * 0.61, size.height, size.width * 0.59, size.height);
    path.cubicTo(size.width * 0.57, size.height, size.width * 0.55, size.height, size.width * 0.54, size.height);
    path.cubicTo(size.width * 0.53, size.height, size.width * 0.52, size.height, size.width * 0.52, size.height * 0.98);
    path.cubicTo(size.width / 2, size.height * 0.98, size.width * 0.49, size.height * 0.97, size.width * 0.48, size.height * 0.95);
    path.cubicTo(size.width * 0.48, size.height * 0.95, size.width * 0.48, size.height * 0.94, size.width * 0.48, size.height * 0.92);
    path.cubicTo(size.width * 0.48, size.height * 0.89, size.width * 0.46, size.height * 0.85, size.width * 0.42, size.height * 0.83);
    path.cubicTo(size.width * 0.39, size.height * 0.81, size.width * 0.34, size.height * 0.81, size.width * 0.31, size.height * 0.83);
    path.cubicTo(size.width * 0.29, size.height * 0.84, size.width * 0.29, size.height * 0.84, size.width * 0.28, size.height * 0.84);
    path.cubicTo(size.width * 0.27, size.height * 0.84, size.width / 4, size.height * 0.84, size.width * 0.24, size.height * 0.83);
    path.cubicTo(size.width * 0.23, size.height * 0.83, size.width * 0.23, size.height * 0.82, size.width * 0.22, size.height * 0.81);
    path.cubicTo(size.width * 0.22, size.height * 0.81, size.width / 5, size.height * 0.79, size.width / 5, size.height * 0.77);
    path.cubicTo(size.width * 0.18, size.height * 0.75, size.width * 0.18, size.height * 0.74, size.width * 0.17, size.height * 0.73);
    path.cubicTo(size.width * 0.17, size.height * 0.72, size.width * 0.16, size.height * 0.72, size.width * 0.16, size.height * 0.71);
    path.cubicTo(size.width * 0.16, size.height * 0.7, size.width * 0.17, size.height * 0.68, size.width * 0.18, size.height * 0.67);
    path.cubicTo(size.width * 0.18, size.height * 0.66, size.width * 0.18, size.height * 0.66, size.width / 5, size.height * 0.65);
    path.cubicTo(size.width * 0.23, size.height * 0.63, size.width / 4, size.height * 0.6, size.width / 4, size.height * 0.56);
    path.cubicTo(size.width / 4, size.height * 0.52, size.width * 0.23, size.height * 0.48, size.width / 5, size.height * 0.47);
    path.cubicTo(size.width * 0.18, size.height * 0.46, size.width * 0.18, size.height * 0.45, size.width * 0.18, size.height * 0.45);
    path.cubicTo(size.width * 0.17, size.height * 0.44, size.width * 0.16, size.height * 0.42, size.width * 0.16, size.height * 0.4);
    path.cubicTo(size.width * 0.16, size.height * 0.4, size.width * 0.17, size.height * 0.4, size.width * 0.17, size.height * 0.39);
    path.cubicTo(size.width * 0.18, size.height * 0.38, size.width * 0.18, size.height * 0.36, size.width / 5, size.height * 0.34);
    path.cubicTo(size.width / 5, size.height * 0.32, size.width * 0.22, size.height * 0.31, size.width * 0.22, size.height * 0.3);
    path.cubicTo(size.width * 0.23, size.height * 0.29, size.width * 0.23, size.height * 0.29, size.width * 0.24, size.height * 0.29);
    path.cubicTo(size.width / 4, size.height * 0.28, size.width * 0.27, size.height * 0.27, size.width * 0.28, size.height * 0.27);
    path.cubicTo(size.width * 0.29, size.height * 0.27, size.width * 0.29, size.height * 0.28, size.width * 0.31, size.height * 0.28);
    path.cubicTo(size.width * 0.34, size.height * 0.3, size.width * 0.39, size.height * 0.3, size.width * 0.42, size.height * 0.28);
    path.cubicTo(size.width * 0.46, size.height * 0.26, size.width * 0.48, size.height * 0.23, size.width * 0.48, size.height * 0.19);
    path.cubicTo(size.width * 0.48, size.height * 0.18, size.width * 0.48, size.height * 0.17, size.width * 0.48, size.height * 0.16);
    path.cubicTo(size.width * 0.49, size.height * 0.15, size.width / 2, size.height * 0.14, size.width * 0.52, size.height * 0.13);
    path.cubicTo(size.width * 0.52, size.height * 0.13, size.width * 0.52, size.height * 0.13, size.width * 0.52, size.height * 0.13);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
