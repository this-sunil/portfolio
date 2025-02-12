import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/AppConstant.dart';
import 'package:portfolio/Validator.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController subject;
  late TextEditingController msg;

  @override
  void initState() {
    // TODO: implement initState
    email = TextEditingController();
    subject = TextEditingController();
    msg = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email = TextEditingController();
    subject = TextEditingController();
    msg = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: AppConstant.greenColor.withOpacity(.3)),
            height: 50,
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Text("Contact Email:",
                        style: context.copyWithStyle(
                            color: AppConstant.indigoColor,
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decorationColor: AppConstant.indigoColor)),
                  ],
                ))),
        SizedBox(height: 50),
        Padding(padding: EdgeInsets.all(8),child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      validator: (val) =>
                          Validators().validateEmail(val.toString()),
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Enter your email",
                      ),
                    )),
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
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppConstant.blackColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final Uri params = Uri(
                            scheme: 'mailto',
                            path: email.text,
                            query:
                            'subject=${subject.text}&body=${msg.text}', //add subject and body here
                          );
                          AppConstant().launchUri(params);
                          formKey.currentState!.save();
                        }
                      },
                      child: Text("Submit",
                          style: context.copyWithStyle(
                              color: AppConstant.whiteColor, fontSize: 16))),
                )
              ],
            ))),
      ],
    );
  }
}
