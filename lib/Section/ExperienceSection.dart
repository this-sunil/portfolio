import 'package:flutter/material.dart';

import '../AppConstant.dart';
import '../Model/Info.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    String firstStatus =
        """
        \u{2022} Integrated third-party libraries such as Firebase, Google Maps, and payment gateways (e.g., RazorPay) to enable seamless communication between the front-end and back-end APIs, enhancing app functionality and performance.
        \u{2022} Implemented Bloc state management for better control over app state, ensuring efficient and scalable data flow,and optimized communication between the user interface and back-end services.
        \u{2022} Successfully deployed applications to both Google Play and the App Store, managing the entire process from initial submission to approval, ensuring apps meet platform-specific guidelines and requirements for public distribution.
        \u{2022} Complex animations within the app UI to enhance visual appeal and improve user interactions, contributing to an engaging and intuitive user experience.Built dynamic and complex app functionalities using the Bloc design pattern, resulting in improved app maintainability, scalability, and ease of adding new features or modifying existing ones.
        \u{2022} Provided continuous app support by promptly addressing bugs, troubleshooting issues, performing necessary bug fixes, and conducting regular code reviews to ensure code quality, maintain performance standards, and improve the overall stability of the application.""";
    String secondStatus = """
       \u{2022} Worked extensively with Firebase Push Notifications and Phone Number Authentication to improve app functionality, providing users with real-time notifications and a secure, streamlined authentication process. This helped increase user engagement and retention by simplifying the login experience.
       \u{2022} Gained hands-on experience in API integration, including performing CRUD operations to manage app data efficiently. Successfully integrated Google Maps Services for location-based features and RazorPay for secure payment processing, ensuring a seamless and user-friendly payment experience within the app.
       \u{2022} Diagnosed and corrected code errors throughout the app,identifying performance bottlenecks and fixing bugs to improve overall app stability, speed, and user satisfaction. Ensured smooth functionality by resolving issues related to data handling, connectivity, and UI performance.
       \u{2022} Conducted thorough user requirement analysis to understand app needs and develop features that address user expectations. Supported features like image uploads to the server, QR code scanning, and advanced debugging  techniques to resolve complex technical challenges and improve app reliability.
       \u{2022} Designed and developed intuitive UI interfaces using the Flutter framework, ensuring an engaging and easy-to-use experience for users across both iOS and Android platforms. Focused on creating responsive, visually appealing layouts and enhancing overall app usability.
       \u{2022} Developed reusable custom widgets and components to streamline the creation of UI elements, reducing development time and ensuring consistent and scalable designs. This approach accelerated the development process and improved the maintainability of the codebase.
    
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
                              fontWeight: FontWeight.bold, fontSize: 16),textAlign: TextAlign.justify),

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
