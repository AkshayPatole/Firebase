import 'package:flutter/material.dart';
import 'package:pro/constants/app_strings.dart';
import 'package:pro/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const TextWidget(text: AppStrings.name,fontSize: 20,),
        ),
        body: const Column(
          children: [
            TextWidget(text: "Ok Successfully Login ")
          ],
        ),
      ),
    );
  }
}
