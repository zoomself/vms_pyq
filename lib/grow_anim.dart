
import 'package:VMESHOU/base/utils/log_utils.dart';
import 'package:flutter/material.dart';

class GrowAim extends StatelessWidget {
  final Widget child;
  final Animation animation;
  const GrowAim({Key? key, required this.child, required this.animation}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
