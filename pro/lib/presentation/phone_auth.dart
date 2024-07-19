import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pro/constants/app_colors.dart';
import 'package:pro/presentation/otp_screen.dart';
import 'package:pro/widgets/button.dart';
import 'package:pro/widgets/sizedbox_widget.dart';
import 'package:pro/widgets/text_formfield.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController PhoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormFieldWidget(
                controller: PhoneController,
                suffixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                keyboardType: TextInputType.number,
                labelText: "PhoneNumber",
              ),
              SizedBoxWidget(height: 20),
              ButtonWidget(
                onClick: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException ex) {},
                    codeSent: (String Verificationid, int? resendToken) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OTPScreen(Verificationid: Verificationid);
                          },
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String VerificationId) {},
                    phoneNumber: PhoneController.text.toString(),
                  );
                },
                text: "Verify OTP",
                textColor: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
