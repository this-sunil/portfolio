import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/AppConstant.dart';

import 'package:portfolio/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  late AnimationController splashController;
  late Animation<int> splashAnimation;
  @override
  void initState() {
    // TODO: implement initState
    splashController=AnimationController(vsync: this,duration: Duration(seconds: 3));
    splashAnimation=StepTween(begin: splashController.duration!.inSeconds,end: 0).animate(CurvedAnimation(parent: splashController, curve: Curves.fastOutSlowIn));
    splashController.forward();
    splashController.addStatusListener((status){
      if(status==AnimationStatus.completed || splashAnimation.value==1){
        MaterialPageRoute route=MaterialPageRoute(builder: (_)=>DashboardScreen());
        Navigator.of(context).pushAndRemoveUntil(route,(s)=>false);
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    splashController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Align(
           alignment: Alignment.center,
           child:  Lottie.asset("assets/icons/loading.json"),
         ),
          AnimatedBuilder(animation: splashAnimation, builder: (context,child){
            return Text("Just a ${splashAnimation.value} second",style: context.copyWithStyle(
                fontSize: 18,
                color: AppConstant.blackColor,
                fontWeight: FontWeight.bold
            ));
          }),
        ],
      ),
    );
  }
}
