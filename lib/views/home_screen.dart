import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g11_appointment_scheduling/admin_views/add_new_doctor_screen_admin.dart';
import 'package:g11_appointment_scheduling/admin_views/donation_screen.dart';
import 'package:g11_appointment_scheduling/admin_views/new_donation_campaign_screen.dart';
import 'package:g11_appointment_scheduling/components/appointment_rectangle_card.dart';
import 'package:g11_appointment_scheduling/components/dummy_appointment_card.dart';
import 'package:g11_appointment_scheduling/components/dummy_sqaure_card.dart';
import 'package:g11_appointment_scheduling/components/service_square_card.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';
import 'package:g11_appointment_scheduling/models/appointment_model.dart';
import 'package:g11_appointment_scheduling/models/doctor_model.dart';
import 'package:g11_appointment_scheduling/viewmodels/user_auth_service.dart';
import 'package:g11_appointment_scheduling/views/admin_dashboard_screen.dart';
import 'package:g11_appointment_scheduling/views/all_service_screen.dart';
import 'package:g11_appointment_scheduling/views/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DoctorModel> doctorsList = [];
  List<AppointmentModel> appointments = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<List<DoctorModel>> getServices() async {
    final servicesSnapshot = await FirebaseFirestore.instance
        .collection(Constants.fcDoctorNode)
        .get();
    int count = servicesSnapshot.docs.length;
    servicesSnapshot.docs.forEach((service) {
      if (doctorsList.length < count) {
        doctorsList.add(DoctorModel.fromJson(service.data()));
      }
    });

    return doctorsList;
  }

  Future<List<AppointmentModel>> getUpcomingAppointmentForUser() async {
    try {
      await FirebaseFirestore.instance
          .collection(Constants.fcAppointments)
          .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .where('apptStatus', isEqualTo: Constants.appointmentActive)
          .get()
          .then((querySnapshot) {
        int count = querySnapshot.docs.length;
        querySnapshot.docs.forEach((doc) {
          if (appointments.length < count) {
            appointments.add(AppointmentModel.fromJson(doc.data()));
          }
        });
      });
      return appointments;
    } catch (e) {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        key: _scaffoldKey,
        drawer: NavigationDrawer(
          tilePadding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
          children: [
            ListTile(
              leading: Icon(
                Icons.bar_chart_rounded,
                color: TealThemeCustomColor,
              ),
              title: Text(
                'Appointments',
                style: kSubHeadingTextStyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.person_add_alt_1_outlined,
                color: TealThemeCustomColor,
              ),
              title: Text(
                'Add Doctors',
                style: kSubHeadingTextStyle,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddNewDoctorScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.monitor_heart_outlined,
                color: TealThemeCustomColor,
              ),
              title: Text(
                'Donations',
                style: kSubHeadingTextStyle,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DonationScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.add_circle_outline_rounded,
                color: TealThemeCustomColor,
              ),
              title: Text(
                'Add Donations',
                style: kSubHeadingTextStyle,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewDonationCampaignScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: TealThemeCustomColor,
              ),
              title: Text(
                'Log out',
                style: kSubHeadingTextStyle,
              ),
              onTap: () async {
                await SignInBackend().logout(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                ClipPath(
                  clipper: const ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60),
                            bottomRight: Radius.circular(60))),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width / 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: TealThemeCustomColor,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      // bring nav drawer
                                      _scaffoldKey.currentState?.openDrawer();
                                    },
                                    child: Image.asset(
                                        "assets/images/filter.png")),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 18,
                                ),
                                Text(
                                  "MediSchedule",
                                  style: kSmallParaTextStyle.copyWith(
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20.0), // Add some bottom padding
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Your heart's\nBestfriend!",
                                      style: kMainTitleBoldTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                    Center(
                                      child: Container(
                                        height: 240,
                                        width: 160,
                                        child: SvgPicture.asset(
                                          "assets/images/docbro2.svg",
                                          // height: 240,
                                          // width: 160,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ServicesListScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      TealCustomButtonlightColor, // Your desired color
                                  shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  // fixedSize: Size.fromHeight(58), // Your desired height
                                ),
                                child: Text(
                                  "Book Appointment",
                                  style: kButtonBigTextStyle.copyWith(
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Doctors",
                          style: kSubHeadingTextStyle,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ServicesListScreen()));
                          },
                          child: Row(
                            children: [
                              Text(
                                "View all",
                                style: kSmallParaTextStyle.copyWith(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                Icons.arrow_forward_outlined,
                                size: 14,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    FutureBuilder(
                        future: getServices(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            return Container(
                              height: MediaQuery.of(context).size.height / 6.5,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: doctorsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ServiceSquareCard(
                                    model: doctorsList[index],
                                  );
                                },
                              ),
                            );
                          }
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    Text(
                      "Upcoming appointments",
                      style: kSubHeadingTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    FutureBuilder(
                        future: getUpcomingAppointmentForUser(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: appointments.length,
                              itemBuilder: (BuildContext context, int index) {
                                return AppointmentCard(
                                    title: appointments[index].username,
                                    day: appointments[index].apptDate,
                                    time: appointments[index].apptTime,
                                    petname: appointments[index].username);
                              },
                            );
                          }
                        }),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
