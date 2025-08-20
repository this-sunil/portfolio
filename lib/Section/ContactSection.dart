import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/AppConstant.dart';
import 'package:portfolio/Validator.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController subject;
  late TextEditingController msg;

  @override
  void initState() {
    // TODO: implement initState

    subject = TextEditingController();
    msg = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    subject = TextEditingController();
    msg = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.sizeOf(context);
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: false,
        //   backgroundColor: AppConstant.appColor,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: [
        //       HeroIcon(HeroIcons.devicePhoneMobile,
        //           color: AppConstant.whiteColor),
        //       SizedBox(width: 10),
        //       Text("Contact",
        //           style: context.copyWithStyle(
        //             color: AppConstant.whiteColor,
        //             fontSize: 18,
        //             fontWeight: FontWeight.bold,
        //           ))
        //     ],
        //   ),
        // ),
        body: Container(
          width: size.width,
            height: size.height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.deepPurple.shade500,
                    Colors.deepOrange.shade400
                  ]),
            ),
            child:Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    flex: 2,
                    child:
                    Lottie.asset("assets/icons/contact.json",width: 200,height: 200)
                  ),
                Expanded(
                    flex: 5,
                    child: Card(
                    margin: EdgeInsets.zero,
                    color: Colors.white,
                    clipBehavior: Clip.hardEdge,
                    child:  Padding(padding: EdgeInsets.symmetric(horizontal: 60),child: Form(
                        key: formKey,
                        child:Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(padding: EdgeInsets.all(10),child: Text("Contact",style: context.copyWithStyle(fontSize: 18,fontWeight: FontWeight.bold))),

                            Padding(
                                padding: EdgeInsets.all(8),
                                child: TextFormField(
                                  controller: subject,
                                  keyboardType: TextInputType.text,
                                  validator: (val) {
                                    if (val!.isEmpty) {}
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    labelText: "Enter your Subject",
                                  ),
                                )),
                            Padding(
                                padding: EdgeInsets.all(8),
                                child: TextFormField(
                                  controller: msg,
                                  validator: (val) {
                                    if (val!.isEmpty) {}
                                    return null;
                                  },
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    floatingLabelBehavior: FloatingLabelBehavior.always,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                    labelText: "Enter your message",
                                  ),
                                )),
                            SizedBox(height: 20),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.sizeOf(context).width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(

                                      backgroundColor: AppConstant.greenColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30))),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      final Uri params = Uri(
                                        scheme: 'mailto',
                                        path: 'swarajya888@gmail.com',
                                        query: 'subject=${Uri.encodeComponent(subject.text)}&body=${Uri.encodeComponent(msg.text)}',
                                      );
                                      AppConstant().launchUri(params);
                                      formKey.currentState!.save();
                                    }
                                  },
                                  child: Text("Submit",
                                      style: context.copyWithStyle(
                                          color: AppConstant.whiteColor,
                                          fontSize: 16))),
                            )
                          ],
                        )),

                    )))
              ],
            )))
    );
  }
}
