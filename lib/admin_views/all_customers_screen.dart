import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/components/customer_rectangle_card.dart';
import 'package:g11_appointment_scheduling/components/dashboard_card.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class AllCustomer extends StatelessWidget {
  AllCustomer({super.key});

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
          child: Text("All customers", style: kMainTitleBoldTextStyle),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardCard(
                      text: "Appointments remaining",
                      icon: Icons.calendar_month_rounded,
                      value: "5"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 60,
                  ),
                  DashboardCard(
                      text: "Today's Appointment",
                      icon: Icons.description_rounded,
                      value: "5"),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 60,
                  ),
                  DashboardCard(
                      text: "Total Customers",
                      icon: Icons.insert_chart_rounded,
                      value: "10"),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Customer name",
                      style: kSmallParaTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "No. of visits",
                      style: kSmallParaTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Email/Phone",
                      style: kSmallParaTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 80,
            ),
            Column(
              children: [
                CustomerCard(
                  text: "C1",
                  name: "Customer 1",
                  visits: "4",
                  email: "customer1@gmail.com",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
