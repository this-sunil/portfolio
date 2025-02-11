import 'package:flutter/material.dart';
class ScaleAnimation extends StatefulWidget {
  final Widget child;
  const ScaleAnimation({super.key, required this.child});

  @override
  State<ScaleAnimation> createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    // TODO: implement initState
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 1));
    animation=Tween<double>(begin: .5,end: 2).animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn));
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
      return ScaleTransition(scale: animationController,child: widget.child);
    });
  }
}
