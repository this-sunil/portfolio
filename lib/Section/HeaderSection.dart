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
            SizedBox(height: 20),
            Flexible(
               flex: 2,
                child: SizedBox(
              width: 150,
              height: 150,
              child: ScaleAnimation(
                child: Card(
                  shape: CircleBorder(),

                  child: CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage("assets/icons/profile.jpeg"),
                  ),
                ),


              ),
            )),
            Flexible(child: Lottie.asset("assets/icons/Welcome.json",width: 200,height:200)),
            Expanded(
                flex: 5,
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
                             Flexible(
                                 flex:2,
                                 child:  SizedBox(
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

                                         ],
                                         isRepeatingAnimation: true,
                                         totalRepeatCount: 10,
                                         pause: const Duration(milliseconds: 500),
                                         displayFullTextOnTap: true,
                                       ),
                                     ),

                                   ],
                                 ))),

                              Responsive.isMobile(context)?SizedBox.shrink(): SizedBox(
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
                              """I am a passionate Flutter Developer with 3+ years of experience in crafting high-performing mobile applications for both Android and iOS. With a strong technical foundation and a keen focus on UI/UX and performance optimization, I excel at leveraging new technologies to enhance app functionality and user experience. I thrive in dynamic environments and am dedicated to producing seamless, user-friendly applications.""",
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
