import 'package:flutter/material.dart';

import '../AppConstant.dart';
import '../Model/Info.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      color: AppConstant.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text("Skills:",
                          style: context.copyWithStyle(
                              color: AppConstant.indigoColor,
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decorationColor: AppConstant.indigoColor)),
                    ],
                  ))),
          Padding(padding: EdgeInsets.all(8),child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Programming Languages : Dart, C",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold))),
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Web Technologies : HTML, CSS,Javascript,Jquery",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold))),
              Padding(padding: EdgeInsets.all(2),child:   Text("\u{2022} Databases : Postgresql",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold))),
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Tools : Git, GitHub,Postman,Android Studio,Vs Code",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold))),
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Frameworks : Flutter,Bootstrap",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold)))
            ],
          ))
        ],
      ),
    );
  }
}
