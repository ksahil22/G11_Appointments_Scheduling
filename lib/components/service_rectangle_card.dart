import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';
import 'package:g11_appointment_scheduling/views/service_detail_screen.dart';

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const ServiceCard({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ServicesDetailScreen()));
      },
      child: Card(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: softGrayStrokeCustomColor,
            width: 2,
          ),
        ),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image on the extreme left
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Column of multiple texts
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: kSmallParaTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: kSmallParaTextStyle.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            "View detail",
                            style: kSmallParaTextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Icon(
                            Icons.arrow_forward_rounded,
                            size: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
