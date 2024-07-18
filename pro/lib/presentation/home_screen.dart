import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pro/constants/app_strings.dart';
import 'package:pro/presentation/login_screen.dart';
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
          actions: [
            IconButton(
              onPressed: () {
                _showLogoutDialog();
              },
              icon: Icon(Icons.logout_outlined),
            ),
          ],
          title: const TextWidget(
            text: AppStrings.name,
            fontSize: 20,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: const Column(
            children: [TextWidget(text: "Ok Successfully Login ")],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextWidget(text: 'Logout'),
          content: TextWidget(text: 'Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: TextWidget(text: 'Cancel'),
            ),
            TextButton(
              onPressed: () {
                _logout();
              },
              child: TextWidget(text: 'Logout'),
            ),
          ],
        );
      },
    );
  }

  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }
}
