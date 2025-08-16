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
                              "A passionate UI developer, with hands on experience of building high performing mobile applications, having a strong technical background. Highly adaptive to new technologies and frameworks & ready for all challenges associated with the industry. Always enthusiastic to learn new technologies which can help the clients solve their problems faster and provide better solutions. My Objective is to work in a firm with a professional work driven environment where I can utilize and apply my knowledge, skills which would enable me as a fresh graduate to grow while fulfilling organizational goals.",
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
