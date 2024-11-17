import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:g11_appointment_scheduling/admin_views/add_new_doctor_screen_admin.dart';
import 'package:g11_appointment_scheduling/admin_views/donation_screen.dart';
import 'package:g11_appointment_scheduling/admin_views/new_donation_campaign_screen.dart';
import 'package:g11_appointment_scheduling/components/dummy_appointment_card.dart';
import 'package:g11_appointment_scheduling/components/dummy_sqaure_card.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        key: _scaffoldKey, // Set the key for the Scaffold

        drawer: NavigationDrawer(
          tilePadding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
          children: [
            ListTile(
              leading: Container(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset('assets/images/logo.svg')),
              title: Text(
                'MediSchedule',
                style: kMainTitleBoldTextStyle.copyWith(fontSize: 18),
              ),
              onTap: () {
                // Handle drawer item tap
              },
            ),
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
                                  "Medi Schedule",
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
                                        child: SvgPicture.asset(
                                            "assets/images/docbro2.svg"),
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
                                      color: Colors.white),
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
                    Row(
                      children: [
                        DummySquareCard(),
                        DummySquareCard(),
                      ],
                    ),
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
                    Column(
                      children: [
                        DummyAppointmentCard(
                          title: "title",
                          day: "day",
                          time: "time",
                        ),
                        DummyAppointmentCard(
                          title: "title",
                          day: "day",
                          time: "time",
                        ),
                      ],
                    )
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
