import 'package:flutter/material.dart';
class FadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  const FadeAnimation({super.key, required this.child, required this.duration});

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync: this,duration: widget.duration);
    animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: animation, builder: (context,child){
      return FadeTransition(

          opacity: animationController,child: widget.child);
    });
  }
}
