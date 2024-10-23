import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class CustomerCard extends StatelessWidget {
  final String text;
  final String name;
  final String visits;
  final String email;

  const CustomerCard({
    Key? key,
    required this.text,
    required this.name,
    required this.visits,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image on the extreme left
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: TealDarkCustomColor, width: 2), // Outer circle
            ),
            child: Center(
              child: Container(
                height: 45, // Adjust the height as needed
                width: 45, // Adjust the width as needed
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: TealLightCustomColor, // Inner circle color
                ),
                child: Center(
                  child: Text(
                    text,
                    style: kSubHeadingTextStyle, // Text color
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          // Column of multiple texts
          Expanded(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: kSmallParaTextStyle.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 15),
          Text(
            visits,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: kSmallParaTextStyle.copyWith(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 10),
          Expanded(
            child: Text(
              email,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: kSmallParaTextStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
