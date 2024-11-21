import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/admin_views/all_customers_screen.dart';
import 'package:g11_appointment_scheduling/components/appointment_rectangle_card.dart';
import 'package:g11_appointment_scheduling/components/dashboard_card.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/const.dart';
import 'package:g11_appointment_scheduling/constants/helper_class.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';
import 'package:g11_appointment_scheduling/models/appointment_model.dart';
import 'package:g11_appointment_scheduling/viewmodels/analytics_viewmodel.dart';
import 'package:g11_appointment_scheduling/viewmodels/appointment_viewmodel.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  int appointmentRemaining = 0;
  int todayAppointment = 0;
  int totalNumberOfCustomers = 0;
  List<AppointmentModel> appointments = [];

  Future<String> getAnalyticsData() async {
    try {
      appointmentRemaining =
          await AnalyticsViewModel().getRemainingTodaysAppointment();
      todayAppointment =
          await AnalyticsViewModel().getNumberOfAppointmentsForToday();
      totalNumberOfCustomers = await AnalyticsViewModel().getNumberOfUsers();
      return "success";
    } catch (e) {
      log(e.toString());
      return "error";
    }
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
          child: Text("Admin Dashboard", style: kMainTitleBoldTextStyle),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.history_rounded,
              color: primaryBlueSoftenCustomColor,
            ),
            onPressed: () async {
              await AppointmentViewModel().setPastAppointmentToDone();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          children: [
            FutureBuilder(
              future: getAnalyticsData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData && snapshot.data == "success") {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DashboardCard(
                          icon: Icons.calendar_today_rounded,
                          text: "Appointments Remaining",
                          value: appointmentRemaining.toString(),
                        ),
                      ),
                      Expanded(
                        child: DashboardCard(
                          icon: Icons.calendar_today_rounded,
                          text: "Today's Appointments",
                          value: todayAppointment.toString(),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllCustomer()));
                          },
                          child: DashboardCard(
                            icon: Icons.person,
                            text: "Total Number of Customers",
                            value: totalNumberOfCustomers.toString(),
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasData && snapshot.data == "error") {
                  return const Center(child: Text("Error while fetching data"));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text("Error while fetching data"));
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming appointments",
                  style:
                      kSmallParaTextStyle.copyWith(fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "View all",
                        style: kSmallParaTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
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
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            FutureBuilder(
                future: getUpcomingAppointmentForUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
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
          ],
        ),
      ),
    );
  }
}
