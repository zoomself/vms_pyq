import 'package:VMESHOU/base/view/circle_progress_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaintTest extends StatefulWidget {
  const PaintTest({Key? key}) : super(key: key);

  @override
  State<PaintTest> createState() => _PaintTestState();
}

class _PaintTestState extends State<PaintTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自定义paint"),
        centerTitle: true,
      ),
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(margin: const EdgeInsets.only(bottom: 50),
                  child: const CircleProgressView(width: 100,progress: 0.56) ),
              RepaintBoundary(
                child: CustomPaint(
                  painter: MyPainter(),
                  size: const Size(300, 300),
                ),
              )
            ],
          )),
    );
  }

}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //背景棋盘
    Paint paint = Paint();
    paint.color = const Color(0xFFDCC48C);
    paint.isAntiAlias = true;
    paint.style = PaintingStyle.fill;

    double w = size.width;
    double h = size.height;
    Rect rect = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2), width: w, height: h);
    canvas.drawRect(rect, paint);

    //线条
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 1;
    for (int i = 0; i < 11; i++) {
      double m = 30 * i.toDouble();
      canvas.drawLine(Offset(0, m), Offset(w, m), paint);
      canvas.drawLine(Offset(m, 0), Offset(m, h), paint);
    }

    //棋子
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;
    int wn = 5;
    Rect qRect = Rect.fromCenter(
        center: Offset(wn * 30, wn * 30), width: 20, height: 20);
    canvas.drawOval(qRect, paint);

    paint.color = Colors.black;
    int bn = 6;
    qRect = Rect.fromCenter(
        center: Offset(bn * 30, bn * 30), width: 20, height: 20);
    canvas.drawOval(qRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}
