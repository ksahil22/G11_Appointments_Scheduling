import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class ServicesDetailScreen extends StatefulWidget {
  const ServicesDetailScreen({
    super.key,
  });

  @override
  State<ServicesDetailScreen> createState() => _ServicesDetailScreenState();
}

class _ServicesDetailScreenState extends State<ServicesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Appointment", style: kMainTitleBoldTextStyle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align elements to the left
            children: [
              CarouselSlider(
                items: [
                  Image.asset(
                    'assets/images/doc.png',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/images/doc.png',
                    fit: BoxFit.contain,
                  ),
                  Image.asset(
                    'assets/images/doc.png',
                    fit: BoxFit.contain,
                  ),
                ],
                options: CarouselOptions(
                  height: 200.0, // Adjust the height as needed
                  aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'doctorName',
                    style: kMainTitleBoldTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "\$20",
                    style: kMainTitleBoldTextStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Text(
                "About service",
                style:
                    kSmallParaTextStyle.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              Text(
                "MBBS",
                style: kSmallParaTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              // ),
              const SizedBox(height: 16.0),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dates",
                    style: kSubHeadingTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 70,
                    child: Card(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        ),
                      ),
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: GestureDetector(
                          onTap: () {},
                          child: ClipPath(
                            clipper: const ShapeBorderClipper(
                              shape: ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            child: Container(
                              color: TealDarkCustomColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "10",
                                      style: kButtonBigTextStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Oct",
                                      style: kSmallParaTextStyle.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    "Select Time",
                    style: kSubHeadingTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    childAspectRatio: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: List.generate(24, (index) {
                      bool isSlotAvailable =
                          true; // Replace with actual condition

                      return GestureDetector(
                        onTap: () {
                          if (isSlotAvailable) {
                            // Handle slot selection logic
                          }
                        },
                        child: ClipPath(
                          clipper: const ShapeBorderClipper(
                            shape: ContinuousRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                            ),
                          ),
                          child: Container(
                            width: 75,
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSlotAvailable
                                    ? TealLightCustomColor
                                    : Colors.redAccent,
                                width: 2,
                              ),
                              color: isSlotAvailable
                                  ? TealLightCustomColor
                                  : Colors.redAccent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "$index:00", // Replace with actual time
                                  style: kSmallParaTextStyle.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: isSlotAvailable
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 60,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Booked",
                            style: kSmallParaTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.5,
                              ),
                              color: TealLightCustomColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Available",
                            style: kSmallParaTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TealCustomButtonlightColor,
                        shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        "Book Appointment",
                        style:
                            kButtonBigTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
