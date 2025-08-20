import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../AppConstant.dart';
import '../Model/Project.dart';


class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Project> projectList = [
      Project(
        title: 'CineQube',
        duration: 'Mar 2024 - Apr 2025',
        playStoreLink:
            'https://play.google.com/store/apps/details?id=com.mt.cineqube',
        features: [
          'Integrated Firebase push notifications with Bloc state management.',
          'Implemented video player using PodPlayer for YouTube/Vimeo playback.',
          'Enabled secure UPI payments using flutter_upi_pay.',
        ],
      ),
      Project(
        title: 'Rajyog Matka',
        duration: 'Aug 2024 - Aug 2024',
        playStoreLink: 'https://dhankalyanmatka.com/',
        features: [
          'Developed core Matka game features: Single, Double, Triple, Family Pana.',
          'Integrated FCM and OneSignal for push notifications.',
          'Added secure UPI payment system with flutter_upi_pay.',
          'Connected backend APIs for smooth withdrawal functionality.',
        ],
      ),
      Project(
        title: 'Grow Knowledge',
        duration: 'Oct 2023 - Nov 2023',
        playStoreLink: '',
        features: [
          'Developed a quiz app with REST API integration.',
          'Implemented Firebase Push Notifications.',
          'Built user flow for free and paid contests.',
          'Added KYC functionality with Aadhaar/PAN upload.',
          'Offline video download with Sqflite integration.',
          'Flexible subscription plans (monthly, quarterly, yearly).',
        ],
      ),
      Project(
          title: "Jeeyo Ride",
          duration: 'Jan 2025',
          playStoreLink: 'https://play.google.com/store/apps/details?id=com.jeeyoride.mt',
          features: [
        'Implemented Google Maps integration with auto-complete place search and geofencing for nearby drivers, coupled with intuitive UI design to enable real-time location tracking and enhance user engagement.',
        'Integrated Firebase push notifications using Bloc state management to ensure seamless and efficient real-time updates and improve overall app responsiveness.'
      ])
    ];

    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: false,
        //   backgroundColor: AppConstant.appColor,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       HeroIcon(HeroIcons.folder, color: AppConstant.whiteColor),
        //       SizedBox(width: 10),
        //       Text("Projects",
        //           style: context.copyWithStyle(
        //             color: AppConstant.whiteColor,
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //           ))
        //     ],
        //   ),
        // ),
        body: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 50),
              Flexible(
                  flex: 2,
                  child: Lottie.asset("assets/icons/steps.json")),
              SizedBox(height: 50),
              Expanded(
                  flex: 5,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                    physics: NeverScrollableScrollPhysics(),
                itemCount: projectList.length,
                itemBuilder: (context, index) {
                  final project = projectList[index];
                  return Card(
                    color: Colors.transparent,
                    clipBehavior: Clip.hardEdge,
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.pinkAccent,
                                    Colors.deepPurple.shade400
                                  ]),
                            ),
                            child:ExpansionTile(
                              initiallyExpanded: false,
                              collapsedIconColor: AppConstant.whiteColor,
                              iconColor: AppConstant.whiteColor,
                              title: Text(
                                project.title,
                                style: context.copyWithStyle(color: AppConstant.whiteColor),
                              ),
                              subtitle: Text(project.duration,style: context.copyWithStyle(color: AppConstant.whiteColor)),
                              childrenPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              children: [
                                if (project.playStoreLink.isNotEmpty)
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextButton.icon(
                                      onPressed: () async {
                                        final url = Uri.parse(project.playStoreLink);
                                        if (await canLaunchUrl(url)) {
                                          await launchUrl(url);
                                        }
                                      },
                                      icon:CircleAvatar(
                                          backgroundColor: Colors.green.shade300,
                                          child:  Icon(Icons.open_in_new,color: AppConstant.blackColor)),
                                      label: Text('View on Play Store',style: context.copyWithStyle(color: AppConstant.whiteColor)),
                                    ),
                                  ),
                                const SizedBox(height: 8),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Key Features:',
                                      style: context.copyWithStyle(color: AppConstant.whiteColor),
                                    )),
                                const SizedBox(height: 4),
                                ...project.features.map((feature) => Padding(padding: EdgeInsets.all(8),child: ListTile(

                                  visualDensity: VisualDensity.compact,
                                  leading: CircleAvatar(
                                      backgroundColor: Colors.green.shade300,
                                      child: Icon(Icons.check, color: Colors.black)),
                                  title: Text(feature,style:context.copyWithStyle(color: AppConstant.whiteColor)),
                                ))),
                              ],
                            ))),
                  );
                },
              ))
            ],
          ),
        ));
  }
}
