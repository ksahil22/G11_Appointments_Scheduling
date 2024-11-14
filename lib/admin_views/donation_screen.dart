import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/components/donation_rectangle_card.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primaryBlueSoftenCustomColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Donations", style: kMainTitleBoldTextStyle),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          children: [
            DonationCard(
                image: "assets/images/doc.png",
                name: "name",
                disease: "disease",
                fund: "fund",
                time: "time"),
            DonationCard(
                image: "assets/images/doc.png",
                name: "name",
                disease: "disease",
                fund: "fund",
                time: "time"),
            DonationCard(
                image: "assets/images/doc.png",
                name: "name",
                disease: "disease",
                fund: "fund",
                time: "time"),
          ],
        ),
      ),
    );
  }
}
