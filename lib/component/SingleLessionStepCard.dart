import 'package:flutter/material.dart';
import 'package:portfolio/AppConstant.dart';

class SingleLessonStepCard extends StatelessWidget {
  const SingleLessonStepCard({
    super.key,
    required this.step,
  });

  final StepDetails step;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppConstant.appColor,
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurpleAccent.shade200,
              Colors.green.shade400
            ]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            step.title,
            style: context.copyWithStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          Text(
            step.name,
            style: context.copyWithStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          if (step.location.isNotEmpty)
            Row(
              children: [
                const Icon(
                  Icons.pin,
                  size: 15,
                ),
                Text(
                  step.location,
                  style: context.copyWithStyle(

                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          else
            Container(),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                step.time,
                style: context.copyWithStyle(

                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              Text(" - ",style: context.copyWithStyle(

                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.white,
              )),

              Text(
                step.duration,
                style: context.copyWithStyle(

                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}

class StepDetails {
  StepDetails({
    required this.title,
    required this.time,
    required this.duration,
    required this.name,
    // ignore: unused_element
    this.location = '',
    this.isCompleted = false,
  });

  final String title, time, duration, name;
  final String location;
  bool isCompleted;
}
