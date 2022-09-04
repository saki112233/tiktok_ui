
import 'package:flutter/material.dart';
import 'dart:math' as math;
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}
class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(vsync: this,
        duration: const Duration(milliseconds: 4000)
    );
    _controller.repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller, builder: (_,child){
      return Transform.rotate(angle:_controller.value*2*math.pi,
        child: child,);
    },
      child: Container(
        height: 45,
        width: 45,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
                image:AssetImage ("assets/disk.png")
            )
        ),
        child: Image.asset("assets/tiktok_logo.jpg"),),
    );
  }
}