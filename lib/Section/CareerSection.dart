import 'package:flutter/material.dart';
import 'package:portfolio/AppConstant.dart';

class CareerSection extends StatelessWidget {
  const CareerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppConstant.whiteColor,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10)),
                  color: AppConstant.greenColor.withOpacity(.3)),
              height: 50,
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Text("CAREER OBJECTIVE:",
                          style: context.copyWithStyle(
                              color: AppConstant.indigoColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decorationColor: AppConstant.indigoColor,
                              decoration: TextDecoration.underline)),
                    ],
                  ))),
          Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Flexible(
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Text(
                              """I am a passionate Flutter Developer with 3+ years of experience in crafting high-performing
    mobile applications for both Android and iOS. With a strong technical foundation and a keen
    focus on UI/UX and performance optimization, I excel at leveraging new technologies to enhance
    app functionality and user experience. I thrive in dynamic environments and am dedicated to
    producing seamless, user-friendly applications.""",
                              style: context.copyWithStyle(
                                  color: AppConstant.blackColor,
                                  fontSize: 16,
                                  fontWeight: context.bold,
                                  decorationColor: AppConstant.blackColor),
                              textAlign: TextAlign.justify)))
                ],
              )),
        ],
      ),
    );
  }
}
