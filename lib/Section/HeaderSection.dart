import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/AppConstant.dart';
import 'package:portfolio/animation/ScaleAnimation.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstant.appColor
      ),
      width: context.width,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleAnimation(child: CircleAvatar(
            maxRadius:83,
            backgroundColor: AppConstant.whiteColor,
            child: CircleAvatar(
              maxRadius: 80,
              backgroundColor: AppConstant.whiteColor,
              backgroundImage: AssetImage("assets/icons/profile.jpeg"),
            ),
          )),
          SizedBox(height: 10),
          Text(AppConstant.name,style: context.copyWithStyle(color: AppConstant.whiteColor,fontSize: 20)),
          Text(AppConstant.headingText,style: context.copyWithStyle(color: AppConstant.whiteColor,fontSize: 20)),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.all(8),
            child:  Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await AppConstant().launchUri(Uri.parse(AppConstant.linkedIn));
                  },
                  icon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppConstant.indigoColor,
                        ),
                        child: Icon(BootstrapIcons.linkedin, color: AppConstant.whiteColor, size: 18),
                      ),
                      SizedBox(width: 20),
                      Text(
                        AppConstant.linkedIn,
                        style: context.copyWithStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppConstant.whiteColor,
                          color: AppConstant.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await AppConstant().launchUri(Uri(scheme: "mailto", path: AppConstant.emailAddress));
                  },
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppConstant.orangeColor,
                        ),
                        child: Icon(Icons.email, color: AppConstant.whiteColor, size: 20),
                      ),
                      SizedBox(width: 20),
                      Text(
                        AppConstant.emailAddress,
                        style: context.copyWithStyle(
                          color: AppConstant.whiteColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppConstant.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await AppConstant().launchUri(Uri(scheme: "tel", path: AppConstant.phoneNumber));
                  },
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppConstant.blueColor,
                        ),
                        child: Icon(Icons.call, color: AppConstant.whiteColor, size: 20),
                      ),
                      SizedBox(width: 20),
                      Text(
                        AppConstant.phoneNumber,
                        style: context.copyWithStyle(color: AppConstant.whiteColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
