import 'package:flutter/material.dart';

class GestureViewPathWidget extends StatelessWidget {
  final Function(DragDownDetails)? onPanDown;
  final Function(DragUpdateDetails)? onPanUpdate;
  final Function(DragEndDetails)? onPanEnd;
  final List<Offset> points;
  final Color color;
  final double pathWidth;

  const GestureViewPathWidget({
    Key? key,
    required this.points,
    this.onPanDown,
    this.onPanUpdate,
    this.onPanEnd,
    this.color = Colors.blue,
    this.pathWidth = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: _PathPainter(points, color: color, pathWidth: pathWidth),
      ),
      onPanDown: _onPanDown,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
    );
  }

  _onPanDown(DragDownDetails e) {
    onPanDown?.call(e);
  }

  _onPanUpdate(DragUpdateDetails e) {
    onPanUpdate?.call(e);
  }

  _onPanEnd(DragEndDetails e) {
    onPanEnd?.call(e);
  }
}

// 绘制手势路径
class _PathPainter extends CustomPainter {
  final List<Offset> points;
  final Color color;
  final double pathWidth;

  // 路径画笔
  final pathPainter = Paint()
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;

  _PathPainter(
    this.points, {
    this.color = Colors.blue,
        this.pathWidth = 4,
  }){
    pathPainter.color = color;
    pathPainter.strokeWidth = pathWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length > 1) {
      for (int index = 0; index < points.length - 1; index++) {
        Offset p1 = points[index];
        Offset p2 = points[index + 1];

        canvas.drawLine(p1, p2, pathPainter);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
