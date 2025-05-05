import 'package:flutter/material.dart';
import 'dart:math';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:developer' as developer;

class EmailUtils {
  static Future<void> sendEmail(recipient_name, recipient_mail, info) async {
    await dotenv.load();
    String username = dotenv.env['EMAIL_USERNAME'] ?? '';
    String password = dotenv.env['EMAIL_PASSWORD'] ?? '';

    developer.log('Email: $username');
    developer.log('Password: $password');

    // Configure the SMTP server
    final smtpServer = gmail(username, password);

    // Create the email message
    final message = Message()
      ..from = Address(username, 'AZOMIN')
      ..recipients.add(recipient_mail) // Recipient email
      ..subject = 'AZOMIN login IDs : ${recipient_name}'
      ..text = 'Your account has been successfully created.'
      ..html =
          '<h1>Your account has been successfully created.</h1> <br/> <p>Email : ${recipient_mail}.</p><br/> <p>Password : ${info}.</p>';

    try {
      // Send the email
      final sendReport = await send(message, smtpServer);
      developer.log('Message sent: ' + sendReport.toString());
      print('Email sent: ${sendReport.toString()}');
    } on MailerException catch (e) {
      print('Email not sent. ${e.toString()}');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
}

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

class PasswordUtils {
  static String generateRandomPassword(int length) {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()_+[]{}|;:,.<>?';
    Random random = Random.secure();
    return List.generate(length, (index) => chars[random.nextInt(chars.length)])
        .join();
  }
}
