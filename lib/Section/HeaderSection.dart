import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/AppConstant.dart';
import 'package:portfolio/animation/ScaleAnimation.dart';

import '../Responsive.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Colors.deepOrange.shade300,
                Colors.deepPurpleAccent.shade700
          ])
        ),
        child: Column(
          children: [
            SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 200,
              child: ScaleAnimation(
                child: Card(
                  shape: CircleBorder(),

                  child: CircleAvatar(
                    maxRadius: 100,
                    backgroundImage: AssetImage("assets/icons/profile.jpeg"),
                  ),
                ),


              ),
            ),
            Flexible(child: Lottie.asset("assets/icons/Welcome.json",width: 200,height:200)),
            Expanded(
                flex: 3,
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: [
                              SizedBox(
                                  width:MediaQuery.sizeOf(context).width/2,
                                  child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                children: [
                                  Text("Hi, I am",
                                      style: context.copyWithStyle(
                                          fontSize: 40, color: AppConstant.whiteColor,fontWeight: FontWeight.bold)),
                                  ShaderMask(
                                      shaderCallback: (bounds) => LinearGradient(
                                        colors: [Colors.tealAccent, Colors.blue],
                                      ).createShader(Rect.fromLTWH(
                                          0, 0, bounds.width, bounds.height)),
                                      child: Text("Sunil Shedge",
                                          style: context.copyWithStyle(
                                            color: AppConstant.whiteColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            shadows: [
                                              Shadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 8,
                                                color: AppConstant.blackColor.withOpacity(
                                                    0.3), // Add transparency for smoothness
                                              ),
                                              Shadow(
                                                offset: Offset(2, 2),
                                                blurRadius: 8,
                                                color: AppConstant.blackColor.withOpacity(
                                                    0.3), // Add transparency for smoothness
                                              ),
                                            ],
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 3),
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        TypewriterAnimatedText(
                                          'I am Flutter Developer',
                                          cursor: "|",
                                          textStyle: context.copyWithStyle(
                                              fontSize: 35.0,
                                              color: AppConstant.whiteColor,

                                              fontWeight: FontWeight.bold),
                                          speed: const Duration(milliseconds: 100),
                                        ),
                                        TypewriterAnimatedText(
                                          '3+ years of experience',
                                          cursor: "|",
                                          textStyle: context.copyWithStyle(
                                              fontSize: 35.0,
                                              color: AppConstant.whiteColor,

                                              fontWeight: FontWeight.bold),
                                          speed: const Duration(milliseconds: 100),
                                        ),
                                      ],
                                      isRepeatingAnimation: true,
                                      totalRepeatCount: 10,
                                      pause: const Duration(milliseconds: 500),
                                      displayFullTextOnTap: true,
                                    ),
                                  ),

                                ],
                              )),
                              if(Responsive.isDesktop(context))
                              SizedBox(
                                  width: 250,
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Lottie.asset("assets/icons/job.json",width: 200,height: 200),
                                ],
                              ))
                            ],
                          )),

                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              "A passionate UI developer, with hands on experience of building high performing mobile applications, having a strong technical background. Highly adaptive to new technologies and frameworks & ready for all challenges associated with the industry. Always enthusiastic to learn new technologies which can help the clients solve their problems faster and provide better solutions.",
                              style: context.copyWithStyle(
                                  color: AppConstant.whiteColor,
                                  fontSize: 16,
                                  fontWeight: context.bold),
                              textAlign: TextAlign.justify,
                            ),
                          ),)
                        ]))),
          ],
        ));
  }
}
