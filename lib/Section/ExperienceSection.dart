import 'package:flutter/material.dart';

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
\u{2022} Built scalable app features using Bloc design pattern, leading to faster feature development cycles and easier long-term maintenance, improving code modularity and reuse by 40–50%.
\u{2022} Provided ongoing app support and maintenance, including prompt bug resolution, regular code reviews, and performance optimizations, enhancing app stability and code quality by 30–45%.
""";

    String secondStatus = """
\u{2022} Implemented Firebase Push Notifications and Phone Number Authentication to deliver real-time user alerts and streamline secure login, contributing to increased user engagement and retention by 25–35% through improved onboarding and communication.
\u{2022} Integrated RESTful APIs and performed CRUD operations to manage app data efficiently, improving backend communication speed and responsiveness by approximately 30%.
\u{2022} Successfully integrated Google Maps and RazorPay services, enabling location-based features and secure in-app payments, which enhanced the user experience and added critical business functionality.
\u{2022} Diagnosed and resolved performance bottlenecks and critical bugs, improving app stability and responsiveness by 30–40%, and ensuring smooth performance across diverse network and device conditions.
\u{2022} Collaborated with stakeholders to conduct user requirement analysis, resulting in the successful implementation of key features such as image uploads, QR code scanning, and improved error handling through advanced debugging and logging techniques.
\u{2022} Designed and developed responsive, cross-platform UI interfaces using Flutter, delivering intuitive user experiences for both Android and iOS platforms and reducing UI-related support issues by 20–25%.
\u{2022} Created reusable custom widgets and modular UI components, accelerating development cycles and improving code maintainability by 40–50%, while ensuring design consistency across the application.
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
    return Row(
      children: [
        Expanded(
            child: Card(
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
                          Text("Experience:",
                              style: context.copyWithStyle(
                                  color: AppConstant.indigoColor,
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decorationColor: AppConstant.indigoColor)),
                        ],
                      ))),
              ...List.generate(company.length, (index) {
                return ListTile(
                  title: Text(company[index].heading,
                      style: context.copyWithStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(company[index].subtitle,
                          style: context.copyWithStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(
                          "${company[index].startYear} - ${company[index].endYear}",
                          style: context.copyWithStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(
                        height: 20,
                      ),
                      Text(company[index].status.toString(),
                          style: context.copyWithStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                );
              })
            ],
          ),
        )),
      ],
    );
  }
}
