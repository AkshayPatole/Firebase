import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/constants/app_colors.dart';
import 'package:pro/constants/app_enum.dart';
import 'package:pro/presentation/home_screen.dart';
import 'package:pro/widgets/alert_box.dart';
import 'package:pro/widgets/button.dart';
import 'package:pro/widgets/icon_widget.dart';
import 'package:pro/widgets/sizedbox_widget.dart';
import 'package:pro/widgets/text_formfield.dart';
import 'package:pro/widgets/text_widget.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget(
            text: "Sign Up",
            fontSize: 15,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: IconWidget(
                data: AppIcons.name.name,
                color: Colors.black,
                height: 50,
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormFieldWidget(
                controller: emailController,
                labelText: "Enter Your Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBoxWidget(height: 25),
              CustomTextFormFieldWidget(
                controller: passwordController,
                labelText: "Enter PassWord",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              SizedBoxWidget(height: 35),
              ButtonWidget(
                width: 250,
                onClick: () {
                  signUp(emailController.text.toString(),
                      passwordController.text.toString());
                },
                text: "Sign Up",
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  signUp(String email, String password) async {
    if (email == "" && password == "") {
      return _showAwesomeSnackbar(context);
    } else {
      // ignore: unused_local_variable
      UserCredential? userCredential;
      try {
        userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          }));
        });
      } on FirebaseAuthException catch (ex) {
        return UiHelpers.AlertBoxWidget(context, ex.code.toString());
      }
    }
  }

  _showAwesomeSnackbar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
          vertical: 100.h,
        ),
        content: AwesomeSnackbarContent(
          title: "Add required Fields", titleFontSize: 18.sp,
          message: "",
          color: AppColors.redColor,
          // inMaterialBanner: false,
          contentType: ContentType.warning,
        ),
      ),
    );
  }
}
