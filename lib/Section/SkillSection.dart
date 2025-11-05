import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../AppConstant.dart';
import '../Model/ChartData.dart';
import '../Model/Skills.dart';
import '../Responsive.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Random random = Random();

    Color getRandomColor() {
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }
    List<Skills> skill = [
      Skills(title: "Front End", description: [
        ChartData("HTML", 50,getRandomColor()),
        ChartData("CSS", 60,getRandomColor()),
        ChartData("JavaScript", 60,getRandomColor()),
        ChartData("Flutter & Dart", 80,getRandomColor()),
      ]),
      Skills(title: "State Management", description: [
        ChartData("Bloc / Cubit", 70,getRandomColor()),
        ChartData("Provider", 60,getRandomColor()),
        ChartData("GETX", 65,getRandomColor()),
      ]),
      Skills(title: "Backend Integration", description: [
        ChartData("RESTFUL APIs", 70,getRandomColor()),
        ChartData("Postgresql", 60,getRandomColor()),
        ChartData("Firebase", 70,getRandomColor()),
        ChartData("Cloud Firestore", 68,getRandomColor())
      ]),
      Skills(title: "Local Storage", description: [
        ChartData("SQLite", 60,getRandomColor()),
        ChartData("Hive", 50,getRandomColor()),
        ChartData("localstore", 60,getRandomColor()),
        ChartData("Shared Preferences", 70,getRandomColor())
      ]),
      Skills(title: "Architecture", description: [
        ChartData("Clean Architecture", 60,getRandomColor()),
        ChartData("MVC Pattern", 60,getRandomColor()),
        ChartData("Repository Pattern", 60,getRandomColor()),
      ]),
      Skills(title: "Tools & Other", description: [
        ChartData("Git & GitHub", 60,getRandomColor()),
        ChartData("CI/CD", 60,getRandomColor()),
        ChartData("postman", 60,getRandomColor()),
        ChartData("App Store Publishing", 60,getRandomColor())
      ]),
    ];
    final size=MediaQuery.sizeOf(context);

    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.amber,
                  Colors.pink,
                  Colors.deepPurpleAccent.shade400
                ])
        ),
        child: ResponsiveGridView.builder(
          clipBehavior: Clip.hardEdge,
            physics:BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            alignment:AlignmentGeometry.center,
            gridDelegate: ResponsiveGridDelegate(
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              crossAxisExtent: Responsive.isMobile(context)?450:400,
              childAspectRatio: size.width/size.height, // Square items
            ),
            itemCount: skill.length,
            itemBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    color: AppConstant.appColor,
                    child: SfCircularChart(
                      enableMultiSelection: true,

                      tooltipBehavior: TooltipBehavior(enable: true),
                      selectionGesture: ActivationMode.singleTap,
                      title: ChartTitle(

                          text: skill[index].title,
                          alignment: ChartAlignment.center,

                          textStyle: context.copyWithStyle(

                              fontWeight: FontWeight.bold,color: AppConstant.whiteColor, fontSize: 16)),
                      legend: Legend(isVisible: true,textStyle: context.copyWithStyle(color: AppConstant.whiteColor)),
                      series: <DoughnutSeries<ChartData, String>>[
                        DoughnutSeries<ChartData, String>(
                          groupMode: CircularChartGroupMode.point,
                          dataSource: List.generate(skill[index].description.length, (current)=>ChartData(

                              skill[index].description[current].category, skill[index].description[current].value,skill[index].description[current].color)),
                          xValueMapper: (ChartData data, _) => data.category,
                          yValueMapper: (ChartData data, _) => data.value,
                          emptyPointSettings: EmptyPointSettings(
                              mode: EmptyPointMode.gap,
                              color: Colors.grey
                          ),
                          dataLabelSettings: DataLabelSettings(
                              isVisible: true),
                          radius: '70%', // Controls the outer size
                          innerRadius: '60%',
                          cornerStyle: CornerStyle.bothFlat,
                          explodeGesture: ActivationMode.singleTap,
                          enableTooltip: true,

                          legendIconType: LegendIconType.diamond,


                          animationDuration: 1000, // Duration in milliseconds
                          explode: true, // Makes it a donut instead of pie
                        )
                      ],
                    ),
                  ));
            }));
  }
}
