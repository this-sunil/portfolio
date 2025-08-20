import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../AppConstant.dart';
import '../Model/Info.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    String firstStatus = """
\u{2022} Integrated third-party libraries including Firebase, Google Maps, and payment gateways such as RazorPay to streamline front-end and back-end API communication, improving app performance, reliability, and feature set by approximately 30–40%.
\u{2022} Implemented Bloc state management to optimize data flow and enhance app architecture, resulting in a 40–50% improvement in maintainability, scalability, and overall state consistency.
\u{2022} Led deployment of mobile applications to both Google Play Store managing the end-to-end submission process and ensuring compliance with platform-specific guidelines, reducing time-to-market by 30–50%.
\u{2022} Designed and developed complex UI animations to elevate user experience and visual appeal, contributing to a 25–35% increase in user engagement and app retention.


""";

    String secondStatus = """
\u{2022} Implemented Firebase Push Notifications and Phone Number Authentication to deliver real-time user alerts and streamline secure login, contributing to increased user engagement and retention by 25–35% through improved onboarding and communication.
\u{2022} Integrated RESTful APIs and performed CRUD operations to manage app data efficiently, improving backend communication speed and responsiveness by approximately 30%.
\u{2022} Successfully integrated Google Maps and RazorPay services, enabling location-based features and secure in-app payments, which enhanced the user experience and added critical business functionality.
\u{2022} Diagnosed and resolved performance bottlenecks and critical bugs, improving app stability and responsiveness by 30–40%, and ensuring smooth performance across diverse network and device conditions.


""";
    List<Info> company = [
      Info(
        heading: "Sunra SoftTech Pvt ltd, Pune",
        subtitle: "Flutter Developer",
        startYear: "JULY 2022",
        endYear: "PRESENT",
        status: firstStatus,
      ),
      Info(
        heading: "Syscryption Technology Pvt Ltd, Pune",
        subtitle: "Flutter Developer",
        startYear: "JAN 2022",
        endYear: "JULY 2022",
        status: secondStatus,
      ),
    ];
    return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepPurpleAccent.shade400,
                      Colors.amber,
                      Colors.pink,

                    ])
            ),
            child:ListView.builder(


          physics: NeverScrollableScrollPhysics(),

          padding: EdgeInsets.all(8),
          itemCount: company.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.tealAccent,
                          Colors.tealAccent,
                          Colors.deepPurpleAccent.shade400
                        ])

                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        company[index].heading,
                        style: context.copyWithStyle(
                          fontWeight: FontWeight.bold,
                          color: AppConstant.blackColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        company[index].subtitle,
                        style: context.copyWithStyle(
                          fontWeight: FontWeight.bold,
                          color: AppConstant.blackColor,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "${company[index].startYear} - ${company[index].endYear}",
                        style: context.copyWithStyle(
                          color: AppConstant.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        company[index].status.toString(),
                        style: context.copyWithStyle(
                          color: AppConstant.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
