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
        ),
        height: 400,
          children: [
                    maxRadius: 83,
                    backgroundColor: AppConstant.whiteColor,
                    child: CircleAvatar(
                      maxRadius: 80,
                      backgroundColor: AppConstant.whiteColor,
                      backgroundImage: AssetImage("assets/icons/profile.jpeg"),
                    ),
                )),
                    children: [
                        onPressed: () async {
                        },
                        ),
                            onPressed: () async {
                            },
                        onPressed: () async {
                        },
                    ],
                  ),
          ],
        ),
      );
  }
}
