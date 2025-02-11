import 'package:flutter/material.dart';

import '../AppConstant.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Container(
           decoration: BoxDecoration(
               borderRadius: BorderRadius.only(
                   topRight: Radius.circular(10),
                   topLeft: Radius.circular(10)
               ),
               color: AppConstant.greenColor.withOpacity(.3)
           ),
           height: 50,
             child:Padding(
                 padding: EdgeInsets.all(8),
                 child: Row(
                   children: [

                     Text("Projects:",
                         style: context.copyWithStyle(
                             color: AppConstant.indigoColor,
                             decoration: TextDecoration.underline,
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             decorationColor: AppConstant.indigoColor)),


                   ],
                 ))
         ),
          Padding(padding: EdgeInsets.all(8),child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Grow knowledge",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold))),
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Hd WallPaper",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold))),
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Go Quiz",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold))),
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Liberty Paint",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold))),
              Padding(padding: EdgeInsets.all(2),child: Text("\u{2022} Farm-House booking",style: context.copyWithStyle(color: AppConstant.blackColor,fontSize: 16,fontWeight: context.bold)))
            ],
          ))
        ],
      ),
    );
  }
}
