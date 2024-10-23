import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/components/service_rectangle_card.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class ServicesListScreen extends StatefulWidget {
  const ServicesListScreen({Key? key}) : super(key: key);

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  @override
  Widget build(BuildContext context) {
    // Dummy list of services (replace with actual model list if needed)
    final List<Map<String, String>> services = [
      {
        "doctorName": "Dr. John Doe",
        "about": "Cardiologist with 10 years of experience",
        "image": "assets/images/doc.png"
      },
      {
        "doctorName": "Dr. Jane Smith",
        "about": "Neurologist specializing in brain disorders",
        "image": "assets/images/doc.png"
      },
      {
        "doctorName": "Dr. Emily White",
        "about": "Pediatrician with a passion for child care",
        "image": "assets/images/doc.png"
      },
    ];

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
        title: Center(
          child: Text("All Doctors", style: kMainTitleBoldTextStyle),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          children: services.map((service) {
            return ServiceCard(
              image: service['image']!,
              title: service['doctorName']!,
              description: service['about']!,
            );
          }).toList(),
        ),
      ),
    );
  }
}
