import 'package:flutter/material.dart';
import 'dart:math';

class MyTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const MyTextWidget(this.text, this.fontSize, this.fontWeight);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

String generateRandomPassword(int length) {
  const String chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()_+[]{}|;:,.<>?';
  Random random = Random.secure();
  return List.generate(length, (index) => chars[random.nextInt(chars.length)])
      .join();
}
