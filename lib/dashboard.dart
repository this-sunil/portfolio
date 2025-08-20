import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:portfolio/Section/ExperienceSection.dart';


import 'AppConstant.dart';
import 'Responsive.dart';
import 'package:portfolio/Section/SideMenu.dart';

import 'Section/ContactSection.dart';
import 'Section/EducationSection.dart';
import 'Section/HeaderSection.dart';
import 'Section/ProjectSection.dart';
import 'Section/SkillSection.dart';
import 'dart:html' as html;

void downloadFile(String url, String fileName) {
// Create a new anchor (<a>) element
  final html.AnchorElement anchor = html.AnchorElement(href: url)
    ..setAttribute(
        'download', fileName) // Specify the file name for the download
    ..target =
        'blank'; // Optional, to open in a new tab (not necessary for download)

// Trigger the download by simulating a click event
  anchor.click();
}
final GlobalKey<ScaffoldState> drawerKey=GlobalKey<ScaffoldState>();
HashSet<int> selected = HashSet<int>();
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PageController pageController;
  int currentIndex=0;
  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController();
    selected.clear();
    selected.add(0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer:  SideMenu(controller: pageController),
      appBar:  AppBar(
              elevation: 10,
              backgroundColor: Color(0xFF2B3A55),
              title: Text(currentIndex==0?"Portfolio":currentIndex==1?"Experience":currentIndex==2?"Skills":currentIndex==3?"Education":currentIndex==4?"Projects":"Contact",
                  style: context.copyWithStyle(
                    color: AppConstant.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              centerTitle: false,
              iconTheme: IconThemeData(color: AppConstant.whiteColor),
              actions: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: OutlinedButton.icon(

                        style: OutlinedButton.styleFrom(

                            backgroundColor: Colors.deepPurpleAccent,
                            padding: EdgeInsets.all(20),
                            side:
                                BorderSide(width: 4, color: Colors.deepPurple),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(color: AppConstant.whiteColor),
                                borderRadius: BorderRadius.circular(30))),
                        icon: HeroIcon(
                          HeroIcons.arrowDownCircle,
                          color: AppConstant.whiteColor,
                        ),

                        onPressed: () {
                          downloadFile(
                              'https://raw.githubusercontent.com/this-sunil/portfolio/main/Resume.pdf',
                              'sunil-shedge_cv.jpg');
                        },
                        label: Text("Download CV",
                            style: context.copyWithStyle(
                                color: AppConstant.whiteColor,fontSize: 14,fontWeight: FontWeight.bold)))),
              ],
            ),
      body:  PageView(
                scrollDirection: Axis.vertical,
                controller: pageController,
                clipBehavior: Clip.hardEdge,
                scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
                physics: ScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                children: [
                  HeaderSection(),
                  ExperienceSection(),
                  SkillSection(),
                  EducationSection(),
                  ProjectSection(),
                  ContactSection()
                ],
              )
    );
  }
}
