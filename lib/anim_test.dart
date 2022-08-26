import 'package:VMESHOU/generated/assets.dart';
import 'package:VMESHOU/grow_anim.dart';
import 'package:flutter/material.dart';

class AnimTest extends StatefulWidget {
  const AnimTest({Key? key}) : super(key: key);

  @override
  State<AnimTest> createState() => _AnimTestState();
}

class _AnimTestState extends State<AnimTest>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2),lowerBound: 0,upperBound: 200);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画"),
        centerTitle: true,
      ),
      body: GrowAim(
          child: Image.asset(Assets.imagesDefeat), animation: controller),
    );
  }
}
