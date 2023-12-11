import 'dart:math';
import 'package:flutter/material.dart';
import 'gesture_view_model.dart';

class GestureDotsPanelWidget extends StatelessWidget {
  final List<GesturePasswordPointModel> points;

  const GestureDotsPanelWidget({Key? key, required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: points.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return GestureViewPoint(
          data: points[index],
        );
      },
    );
  }
}

class GestureViewPoint extends StatelessWidget {
  final GesturePasswordPointModel data;

  const GestureViewPoint({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Stack(
        children: [
          CustomPaint(
            painter: LinePainter(
              radius: data.frameRadius,
              style: PaintingStyle.stroke,
              color: data.frameColor,
            ),
          ),
          CustomPaint(
            painter: LinePainter(
              radius: data.pointRadius,
              color: data.pointColor,
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final double radius;
  final PaintingStyle style;
  final Color color;

  LinePainter({
    required this.radius,
    this.style = PaintingStyle.fill,
    this.color = Colors.grey,
  });

  //定义画笔
  final Paint _paint = Paint()
    ..color = Colors.grey
    ..strokeCap = StrokeCap.square
    ..isAntiAlias = true
    ..strokeWidth = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    _paint.style = style;
    _paint.color = color;
    canvas.drawCircle(Offset.zero, radius, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

Color get random => Color.fromRGBO(
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
      1,
    );
