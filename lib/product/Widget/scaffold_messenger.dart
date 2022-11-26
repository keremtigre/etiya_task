import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

scaffoldMessengerHelper(BuildContext context, String text, int seconds) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: seconds),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.red.shade400,
      content: AutoSizeText(text)));
}
