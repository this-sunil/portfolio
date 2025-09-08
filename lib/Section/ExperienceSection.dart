import 'package:flutter/material.dart';


import '../AppConstant.dart';
import '../Model/Info.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    String firstStatus = """
\u{2022} Integrated Google Mobile Ads SDK into Flutter application to monetize via ads.
\u{2022} Configured AdMob App ID and set up Banner Ads, Interstitial Ads, and Rewarded Ads.
\u{2022} Utilized the google_mobile_ads Flutter package for seamless ad rendering.
\u{2022} Implemented platform-specific configurations for Android (AndroidManifest.xml) and ios (Info.plist).
\u{2022} Integrated third-party libraries (Firebase, Google Maps, RazorPay) improving app performance and backend communication by up to 40%.
\u{2022} Used Bloc for state management, improving code scalability and maintainability by 50%.
\u{2022} Managed app store deployment processes (Play Store & App Store), reducing time-to-market by up to 60%.
\u{2022} Designed interactive UI components and animations, increasing user engagement by
25-35%.


""";

    String secondStatus = """
\u{2022} Developed and optimized Flutter apps with RESTful API integration and CRUD operations.
\u{2022} Implemented Google Maps and RazorPay to support location-based services and secure in-app payments.
\u{2022} Resolved critical bugs and optimized performance, increasing app stability by 40%.
\u{2022} Created reusable UI components and custom widgets to speed up development and ensure code consistency.
\u{2022} To integrate QR code scanning functionality in a Flutter app using Dart.


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
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          company[index].status.toString(),
                          style: context.copyWithStyle(
                            color: AppConstant.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.justify,
                        ),
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
