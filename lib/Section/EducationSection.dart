import 'package:flutter/material.dart';

import '../AppConstant.dart';
import '../Model/Info.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Info> education = [
      Info(
          heading: "Sarhad College of Arts,Commerce Science,Pune",
          subtitle: "M.Sc Computer Science",
          startYear: "JUNE 2019",
          endYear: "APRIL 2021"),
      Info(
          heading: "Vishwakarma College of Arts,Commerce Science,Pune",
          subtitle: "B.Sc. Computer Science",
          startYear: "JUNE 2015",
          endYear: "OCT 2018"),

      Info(
          heading: "Sahakar Maharshi Shankarrao Mohite Patil Mahavidyalaya,Rahimatpur",
          subtitle: "H.S.C",
          startYear: "JULY 2014",
          endYear: "FEB 2015"),
      Info(
          heading: "Dr.V.G. Kakasaheb Paranjape Vidyalaya,Rahimatpur",
          subtitle: "S.S.C",
          startYear: "JULY 2012",
          endYear: "MARCH 2013"),
    ];
    return  Card(
      color: AppConstant.whiteColor,
      child: Column(
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

                      Text("Education:",
                          style: context.copyWithStyle(
                              color: AppConstant.indigoColor,
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decorationColor: AppConstant.indigoColor)),
                    ],
                  ))),
          ...List.generate(education.length, (index) {
            return ListTile(
              title: Text(education[index].heading,
                  style: context.copyWithStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(education[index].subtitle,
                      style: context.copyWithStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                      "${education[index].startYear} - ${education[index].endYear}",
                      style: context.copyWithStyle(
                          fontWeight: FontWeight.bold, fontSize: 12))
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
