import 'package:flutter/material.dart';
import 'package:portfolio/AppConstant.dart';
import 'package:portfolio/Section/CareerSection.dart';
import 'package:portfolio/Section/ContactSection.dart';
import 'package:portfolio/Section/EducationSection.dart';
import 'package:portfolio/Section/ExperienceSection.dart';
import 'package:portfolio/Section/HeaderSection.dart';
import 'package:portfolio/Section/ProjectSection.dart';
import 'package:portfolio/animation/FadeAnimation.dart';

import 'Section/SkillSection.dart';





class BioPage extends StatefulWidget {
  const BioPage({super.key});

  @override
  State<BioPage> createState() => _BioPageState();
}

class _BioPageState extends State<BioPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(

          children: [
            FadeAnimation(duration: Duration(seconds: 1), child:  HeaderSection()),
            FadeAnimation(duration: Duration(seconds: 2), child: Padding(padding: EdgeInsets.all(4),child:  CareerSection())),
            FadeAnimation(duration: Duration(seconds: 3),child: Padding(padding: EdgeInsets.all(4),child: SkillSection())),
            FadeAnimation(duration: Duration(seconds: 4),child: Padding(padding: EdgeInsets.all(4),child:  ExperienceSection())),
            FadeAnimation(duration: Duration(seconds: 5),child: Padding(padding: EdgeInsets.all(4),child:  EducationSection())),
            FadeAnimation(duration: Duration(seconds: 6),child:  Padding(padding: EdgeInsets.all(4),child: ProjectSection())),
            FadeAnimation(duration: Duration(seconds: 7),child: Padding(padding: EdgeInsets.all(8),child: ContactSection()))
          ],
        ),
      ),
    );
  }
}
