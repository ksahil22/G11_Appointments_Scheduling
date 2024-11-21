import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';
import 'package:g11_appointment_scheduling/models/doctor_model.dart';
import 'package:g11_appointment_scheduling/views/service_detail_screen.dart';

class ServiceSquareCard extends StatelessWidget {
  final DoctorModel model;

  const ServiceSquareCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add navigation to service detail screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ServicesDetailScreen(
                      serviceId: model.doctorId,
                      serviceModel: model,
                    )));
      },
      child: Card(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: softGrayStrokeCustomColor,
            width: 2,
          ),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 9.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 70, // Adjust the width as needed
                height: 42, // Adjust the height as needed
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.46),
                  image: DecorationImage(
                    image: AssetImage('assets/images/doc.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 6), // Adjust the spacing as needed
              Text(
                model.doctorName,
                overflow: TextOverflow.ellipsis,
                style: kSmallParaTextStyle.copyWith(
                  fontSize: 12, // Adjust the font size as needed
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
