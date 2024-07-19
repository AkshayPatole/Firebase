import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/constants/app_colors.dart';
import 'package:pro/constants/app_enum.dart';
import 'package:pro/widgets/alert_box.dart';
import 'package:pro/widgets/button.dart';
import 'package:pro/widgets/sizedbox_widget.dart';
import 'package:pro/widgets/text_formfield.dart';

class ForgetPassWordScreen extends StatefulWidget {
  const ForgetPassWordScreen({super.key});

  @override
  State<ForgetPassWordScreen> createState() => _ForgetPassWordScreenState();
}

class _ForgetPassWordScreenState extends State<ForgetPassWordScreen> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
              ),
              CustomTextFormFieldWidget(
                controller: emailController,
                labelText: "Forget Password",
                suffixIcon: Icon(Icons.email_outlined),
              ),
              SizedBoxWidget(height: 20),
              ButtonWidget(
                width: 200,
                onClick: () {
                  forgetPassword(emailController.text.toString());
                },
                text: "Reseat Password",
                fontSize: 13.sp,
                textColor: AppColors.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  forgetPassword(
    String email,
  ) {
    if (email == "") {
      return UiHelpers.AlertBoxWidget(
          context, "Enter an Email to Reseat Password.");
    } else {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
}
