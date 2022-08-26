import 'dart:math';

import 'package:VMESHOU/base/utils/log_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CircleProgressView extends StatefulWidget {
  final double width;
  final double progress;

  const CircleProgressView({Key? key, required this.width, required this.progress}) : super(key: key);

  @override
  State<CircleProgressView> createState() => _CircleProgressViewState();
}

class _CircleProgressViewState extends State<CircleProgressView>
    with SingleTickerProviderStateMixin,DiagnosticableTreeMixin {
  late AnimationController _controller;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty("progress", _controller.value));
  }


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: widget.progress*2*pi,
        duration: const Duration(seconds: 3));
    _controller.addListener(() {
      LogUtils.log("VALUE:${_controller.value}");
      setState(() {

      });
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        painter: CircleProgressPainter(_controller.value),
        size: Size(widget.width, widget.width),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;
  CircleProgressPainter(this.progress); //背景圆圈

  void paintBgCircle(Paint paint, Canvas canvas, Size size) {
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;
    paint.color = Colors.grey;
    canvas.drawCircle(
        Offset(size.width / 2, size.width / 2), size.width / 2, paint);
  }

  //进度圆圈
  void paintProgressCircle(Paint paint, Canvas canvas, Size size) {
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.stroke;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 10;
    paint.color = Colors.blue;
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.width / 2), radius: size.width / 2);
    canvas.drawArc(rect, -0.5*pi, progress, false, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paintBgCircle(paint, canvas, size);

    //进度圆圈
    paint = Paint();
    paintProgressCircle(paint, canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
