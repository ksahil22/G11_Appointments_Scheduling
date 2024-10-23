import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class DashboardCard extends StatelessWidget {
  final icon;
  final String text;
  final String value;

  const DashboardCard({
    super.key,
    required this.text,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: softGrayStrokeCustomColor,
          width: 2,
        ),
      ),
      surfaceTintColor: Colors.white,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 24,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              // SizedBox(height: 4), // Adjust the spacing as needed
              Text(
                text,
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 12, // Adjust the font size as needed
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                maxLines: 2,
              ),
              Text(
                value,
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 20, // Adjust the font size as needed
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
