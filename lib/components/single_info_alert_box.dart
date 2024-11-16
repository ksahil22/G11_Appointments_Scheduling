import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class SingleInfoAlertBox extends StatelessWidget {
  final String text;
  final VoidCallback onOkPressed;

  const SingleInfoAlertBox({
    required this.text,
    required this.onOkPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Alert',
        style: kButtonBigTextStyle,
      ),
      content: Text(text),
      actions: [
        TextButton(
          onPressed: onOkPressed,
          child: Text('OK'),
        ),
      ],
    );
  }
}
