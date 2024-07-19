import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/presentation/home_screen.dart';
import 'package:pro/widgets/button.dart';
import 'package:pro/widgets/sizedbox_widget.dart';
import 'package:pro/widgets/text_formfield.dart';
import 'package:pro/widgets/text_widget.dart';

class OTPScreen extends StatefulWidget {
  String Verificationid;
  OTPScreen({super.key, required this.Verificationid});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController optController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            AppBar(title: TextWidget(text: "OTP Screen"), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              CustomTextFormFieldWidget(
                controller: optController,
                labelText: "Enter OTP",
              ),
              SizedBoxWidget(height: 30),
              ButtonWidget(
                onClick: () async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                      verificationId: widget.Verificationid,
                      smsCode: optController.text.toString(),
                    );
                    FirebaseAuth.instance.signInWithCredential(credential).then(
                      (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                        );
                      },
                    );
                  } catch (ex) {
                    print(ex.toString());
                  }
                },
                text: "OTP",
              )
            ],
          ),
        ),
      ),
    );
  }
}
