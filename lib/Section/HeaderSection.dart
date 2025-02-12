import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/AppConstant.dart';
import 'package:portfolio/animation/ScaleAnimation.dart';

import 'dart:html' as html;

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        decoration: BoxDecoration(
          color: AppConstant.appColor,
        ),
        width: constraint.maxWidth,
        height: 400,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 10,
              right: 10,
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: AppConstant.indigoColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  icon: Icon(BootstrapIcons.download,
                      color: AppConstant.whiteColor),
                  onPressed: () {
                    downloadFile(
                        'https://raw.githubusercontent.com/this-sunil/portfolio/main/Resume.pdf',
                        'sunil-shedge_cv.jpg');
                  },
                  label: Text("Download CV",
                      style: context.copyWithStyle(
                          color: AppConstant.whiteColor, fontSize: 16))),
            ),
            Positioned(
                top: 80,
                child: ScaleAnimation(
                  child: CircleAvatar(
                    maxRadius: 83,
                    backgroundColor: AppConstant.whiteColor,
                    child: CircleAvatar(
                      maxRadius: 80,
                      backgroundColor: AppConstant.whiteColor,
                      backgroundImage: AssetImage("assets/icons/profile.jpeg"),
                    ),
                  ),
                )),
            Positioned(
                bottom: 110,
                child: Text(
                  AppConstant.name,
                  style: context.copyWithStyle(
                      color: AppConstant.whiteColor, fontSize: 20),
                )),
            Positioned(
                bottom: 80,
                child: Text(
                  AppConstant.headingText,
                  style: context.copyWithStyle(
                      color: AppConstant.whiteColor, fontSize: 20),
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () async {
                              await AppConstant()
                                  .launchUri(Uri.parse(AppConstant.linkedIn));
                            },
                            icon: CircleAvatar(
                              backgroundColor: AppConstant.indigoColor,
                              child: Icon(BootstrapIcons.linkedin,
                                  color: AppConstant.whiteColor, size: 20),
                            ),
                          )),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () async {
                              await AppConstant().launchUri(Uri(
                                  scheme: "mailto",
                                  path: AppConstant.emailAddress));
                            },
                            icon: CircleAvatar(
                                backgroundColor: AppConstant.orangeColor,
                                child: Icon(Icons.email,
                                    color: AppConstant.whiteColor, size: 20)),
                          )),
                      Padding(
                          padding: EdgeInsets.all(8),
                          child: IconButton(
                            onPressed: () async {
                              await AppConstant().launchUri(Uri(
                                  scheme: "tel",
                                  path: AppConstant.phoneNumber));
                            },
                            icon: CircleAvatar(
                                backgroundColor: AppConstant.greenColor,
                                child: Icon(Icons.call,
                                    color: AppConstant.whiteColor, size: 20)),
                          )),
                    ],
                  ),
                ))
          ],
        ),
      );
    });
  }
}
