import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/components/donation_rectangle_card.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class DonationDetail extends StatefulWidget {
  const DonationDetail({
    super.key,
  });

  @override
  State<DonationDetail> createState() => _DonationDetailState();
}

class _DonationDetailState extends State<DonationDetail> {
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Donation Details", style: kMainTitleBoldTextStyle),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Funds",
                    style: kSubHeadingTextStyle,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total fund raised: \$ 200",
                          style: kSubHeadingTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Goal: \$ 3000",
                          style: kSubHeadingTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w900)),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Text(
                    "Information",
                    style: kSubHeadingTextStyle,
                  ),
                  Container(
                    height: 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Text(
                    "Payment history",
                    style: kSubHeadingTextStyle,
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      PaymentCard(
                          fund: "fund", time: "time", donator: "donator")
                    ],
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            TealCustomButtonlightColor, // Your desired color
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        // fixedSize: Size.fromHeight(58), // Your desired height
                      ),
                      child: Text(
                        "Donate",
                        style:
                            kButtonBigTextStyle.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
