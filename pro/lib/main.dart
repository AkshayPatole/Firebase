import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pro/firebase_options.dart';
import 'package:pro/presentation/check_user_screen.dart';
import 'package:pro/presentation/phone_auth.dart';
import 'package:pro/presentation/show_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 740),
      builder: (context, child) {
        return const MaterialApp(home: ShowDataScreen()
            // PhoneAuthScreen()
            // CheckUser(),
            );
      },
    );
  }
}
