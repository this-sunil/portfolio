import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lottie/lottie.dart';
import '../AppConstant.dart';
import '../Model/Info.dart';
import '../component/SingleLessionStepCard.dart';

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
          heading: "Dr. V. G. Kakasaheb Paranjape Vidyalaya,Rahimatpur",
          subtitle: "S.S.C",
          startYear: "JULY 2012",
          endYear: "MARCH 2013"),
    ];
    List<StepDetails> educationSteps = education.map((e) {
      return StepDetails(
        title: e.heading,
        time: e.startYear,
        duration: e.endYear,
        name: e.subtitle,
        isCompleted: true, // or any logic if needed
      );
    }).toList();

    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: false,
      //   backgroundColor: AppConstant.appColor,
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     children: [
      //       HeroIcon(HeroIcons.academicCap,color: AppConstant.whiteColor),
      //       SizedBox(width: 10),
      //       Text("Education",
      //           style: context.copyWithStyle(
      //             color: AppConstant.whiteColor,
      //             fontSize: 18,
      //             fontWeight: FontWeight.bold,
      //           ))
      //     ],
      //   ),
      // ),
      body: Container(

          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepPurple.shade500,
                  Colors.deepOrange.shade400
                ]),
          ),
          child:Column(
        children: [
          Expanded(

              child:
                  Lottie.asset("assets/icons/job.json",width: 200,height: 200),
              ),
          Expanded(
              flex: 4,
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: ScrollPhysics(),
              itemCount: educationSteps.length,
              itemBuilder: (ctx, index) {
                int nextIndex = index + 1;
                bool nextOneDone = true;
                if (nextIndex < educationSteps.length) {
                  nextOneDone = educationSteps[nextIndex].isCompleted;
                }
                return _buildStepCard(
                  educationSteps[index],
                  isFirst: index == 0,
                  isLast: index == (educationSteps.length - 1),
                  nextLessonCompleted: nextOneDone,
                );
              },
            ),
          ))
        ],
      )),
    );
  }

  IntrinsicHeight _buildStepCard(StepDetails step,
      {bool isFirst = false,
        bool isLast = false,
        bool nextLessonCompleted = false}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                isFirst
                    ? Expanded(child: Container())
                    : Expanded(
                  child: VerticalDivider(
                    color: step.isCompleted ? Colors.green : Colors.grey,
                    thickness: 2,
                    width: 2,
                  ),
                ),
                step.isCompleted
                    ? Image.asset(
                  'assets/icons/oval_red.png',
                  color: Colors.green,
                  width: 16,
                )
                    : Image.asset(
                  'assets/icons/oval.png',
                  width: 16,
                  color: Colors.green,
                ),
                isLast
                    ? Expanded(flex: 2, child: Container())
                    : nextLessonCompleted
                    ? Expanded(
                  flex: 2,
                  child: VerticalDivider(
                    color:
                    step.isCompleted ? Colors.green : Colors.grey,
                    thickness: 2,
                    width: 2,
                  ),
                )
                    : const Expanded(
                  flex: 2,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    width: 2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: SingleLessonStepCard(step: step))
        ],
      ),
    );
  }

}
