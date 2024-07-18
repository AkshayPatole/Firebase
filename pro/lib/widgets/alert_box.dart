import 'package:flutter/material.dart';

class UiHelpers {
  static AlertBoxWidget(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("invalid information"),
        );
      },
    );
  }
}
