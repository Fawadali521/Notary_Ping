// ignore_for_file: file_names

import '../../../../index.dart';

//Copy this CustomPainter code to the Bottom of the File
class MarkerProfile extends CustomPainter {
  final Color color;
  MarkerProfile({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(31, 5);
    path_0.cubicTo(19.402, 5, 10, 14.402, 10, 26);
    path_0.cubicTo(10, 35.0508, 15.7257, 42.7642, 23.7525, 45.7158);
    path_0.cubicTo(23.8295, 45.8203, 23.9163, 45.9215, 24.0132, 46.0184);
    path_0.lineTo(29.2329, 51.2342);
    path_0.cubicTo(30.209, 52.2096, 31.791, 52.2096, 32.7671, 51.2342);
    path_0.lineTo(37.9867, 46.0184);
    path_0.cubicTo(38.0837, 45.9215, 38.1705, 45.8203, 38.2475, 45.7158);
    path_0.cubicTo(46.2743, 42.7642, 52, 35.0508, 52, 26);
    path_0.cubicTo(52, 14.402, 42.598, 5, 31, 5);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color;
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
