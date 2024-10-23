import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/admin_views/all_customers_screen.dart';
import 'package:g11_appointment_scheduling/components/dashboard_card.dart';
import 'package:g11_appointment_scheduling/components/dummy_appointment_card.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

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
          child: Text("Dashboard", style: kMainTitleBoldTextStyle),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.history_rounded,
              color: primaryBlueSoftenCustomColor,
            ),
            onPressed: () async {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: DashboardCard(
                    icon: Icons.calendar_today_rounded,
                    text: "Appointments Remaining",
                    value: "5",
                  ),
                ),
                Expanded(
                  child: DashboardCard(
                    icon: Icons.calendar_today_rounded,
                    text: "Today's Appointments",
                    value: "10",
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
                      text: "Total Customers",
                      value: "10",
                    ),
                  ),
                ),
              ],
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
            ),
          ],
        ),
      ),
    );
  }
}
