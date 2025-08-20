import 'dart:collection';
import 'dart:developer';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:portfolio/AppConstant.dart';
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/dashboard.dart';

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



class SideMenu extends StatefulWidget {
  final PageController controller;
  const SideMenu({super.key, required this.controller});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int currentIndex = 0;
  Future<void> launchUrlLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      log("Could not launch => $url");
    }

    log("message => $url");
  }
  multiSelect(int index) {
    selected.clear();
    selected.add(index);
    Future.delayed(Duration(milliseconds: 100), () => setState(() {}));
  }

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
    return Drawer(
      clipBehavior: Clip.hardEdge,
      backgroundColor: AppConstant.appColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: Opacity(opacity: 1,child:NestedScrollView(headerSliverBuilder: (context,scroll){
        return [
          SliverToBoxAdapter(
            child: Container(
                width: 300,

                decoration: BoxDecoration(color: AppConstant.appColor),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          maxRadius: 60,
                          backgroundImage: AssetImage("assets/icons/profile.jpeg"),
                        )),
                    SizedBox(height: 10),
                    ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                        ).createShader(
                            Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                        child: Text("Sunil Shedge",
                            style: context.copyWithStyle(
                              color: AppConstant.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              shadows: [
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 8,
                                  color: AppConstant.blackColor.withOpacity(
                                      0.3), // Add transparency for smoothness
                                ),
                                Shadow(
                                  offset: Offset(2, 2),
                                  blurRadius: 8,
                                  color: AppConstant.blackColor.withOpacity(
                                      0.3), // Add transparency for smoothness
                                ),
                              ],
                            ))),
                    /*ShaderMask(
              shaderCallback: (bounds) => LinearGradient(
                    colors: [Colors.purple, Colors.blue],
                  ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
              child: Text("Flutter Developer",
                  style: context.copyWithStyle(
                    color: AppConstant.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: AppConstant.blackColor.withOpacity(
                            0.3), // Add transparency for smoothness
                      ),
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 8,
                        color: AppConstant.blackColor.withOpacity(
                            0.3), // Add transparency for smoothness
                      ),
                    ],
                  ))),*/
                    SizedBox(height: 10),

                  ],
                )),
          )
        ];
      }, body:  SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MenuTile(
              currentIndex: 0,
              onChange: (index) {
                multiSelect(index);
                widget.controller.jumpToPage(0);
              },
              title: "About",
              icons: HeroIcon(HeroIcons.informationCircle,
                  color: selected.contains(0)
                      ? AppConstant.whiteColor
                      : AppConstant.blackColor),
            ),
            MenuTile(
              currentIndex: 1,
              onChange: (index) {
                multiSelect(index);
                widget.controller.jumpToPage(1);
              },
              title: "Experience",
              icons: HeroIcon(HeroIcons.star,
                  color: selected.contains(1)
                      ? AppConstant.whiteColor
                      : AppConstant.blackColor),
            ),
            MenuTile(
              currentIndex: 2,
              onChange: (index) {
                multiSelect(index);
                widget.controller.jumpToPage(2);
              },
              title: "Skills",
              icons: HeroIcon(HeroIcons.scale,
                  color: selected.contains(2)
                      ? AppConstant.whiteColor
                      : AppConstant.blackColor),
            ),
            MenuTile(
              currentIndex: 3,
              onChange: (index) {
                multiSelect(index);
                widget.controller.jumpToPage(3);
              },
              title: "Education",
              icons: HeroIcon(HeroIcons.academicCap,
                  color: selected.contains(3)
                      ? AppConstant.whiteColor
                      : AppConstant.blackColor),
            ),
            MenuTile(
              currentIndex: 4,
              onChange: (index) {
                multiSelect(index);
                widget.controller.jumpToPage(4);
              },
              title: "Projects",
              icons: HeroIcon(HeroIcons.folder,
                  color: selected.contains(4)
                      ? AppConstant.whiteColor
                      : AppConstant.blackColor),
            ),
            MenuTile(
              currentIndex: 5,
              onChange: (index) {
                multiSelect(index);
                widget.controller.jumpToPage(5);
              },
              title: "Contact",
              icons: HeroIcon(HeroIcons.devicePhoneMobile,
                  color: selected.contains(5)
                      ? AppConstant.whiteColor
                      : AppConstant.blackColor),
            ),
            MenuTile(
              currentIndex: 6,
              onChange: (index) async{
                multiSelect(index);
                await launchUrlLink("https://www.linkedin.com/in/sunilshedge");
              },
              title: "LinkedIn",
              icons: Icon(BootstrapIcons.linkedin,
                  color: selected.contains(6)
                      ? AppConstant.whiteColor
                      : AppConstant.blackColor),
            ),
            MenuTile(
              currentIndex: 7,
              onChange: (index) {
                multiSelect(7);
                downloadFile(
                    'https://raw.githubusercontent.com/this-sunil/portfolio/main/Resume.pdf',
                    'sunil-shedge_cv.jpg');
              },
              title: "Download CV",
              icons: HeroIcon(HeroIcons.arrowDownCircle,
                  color: selected.contains(7)
                      ? AppConstant.whiteColor
                      : AppConstant.blackColor),
            ),
          ],
        ),
      )),
      ));
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final Widget icons;

  final int currentIndex;
  final Function(int index)? onChange;

  const MenuTile({
    super.key,
    required this.title,
    required this.icons,
    required this.currentIndex,
    this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selected.contains(currentIndex);
    return Card(
      margin: const EdgeInsets.only(right: 5, top: 5, bottom: 5),
      elevation: isSelected ? 20 : 0,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 3, color: Color(0xFF454D5A)),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      color: isSelected ? Colors.amber : AppConstant.appColor,
      child: ListTile(
        onTap: () {
          onChange?.call(currentIndex);
          drawerKey.currentState?.closeDrawer();
        },
        contentPadding: const EdgeInsets.all(4),
        leading: SizedBox(
          width: 50,
          height: 50,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: isSelected ? Colors.deepOrange.shade500 : Colors.amber,
            child: icons,
          ),
        ),
        title: Text(
          title,
          style: context.copyWithStyle(
            color: isSelected ? AppConstant.blackColor : AppConstant.whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
