import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g11_appointment_scheduling/components/appointment_rectangle_card.dart';
import 'package:g11_appointment_scheduling/components/customer_rectangle_card.dart';
import 'package:g11_appointment_scheduling/components/dashboard_card.dart';
import 'package:g11_appointment_scheduling/views/admin_dashboard_screen.dart';

void main() {
  group('Admin Dashboard UI Tests', () {
    testWidgets('should display all UI elements correctly',
        (WidgetTester tester) async {
      // Build the Admin Dashboard
      await tester.pumpWidget(MaterialApp(home: Dashboard()));
      await tester.pumpAndSettle();

      // Verify "Admin Dashboard" text is displayed
      expect(find.text("Admin Dashboard"), findsOneWidget);

      // Verify "Upcoming appointments" text is displayed
      expect(find.text("Upcoming appointments"), findsOneWidget);

      // Verify "View all" text is displayed
      expect(find.text("View all"), findsOneWidget);
    });

    testWidgets('Dashboard Card Tests', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: DashboardCard(
            icon: Icons.calendar_month_rounded,
            text: 'Appointments Remaining',
            value: '5',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify "Appointments Remaining" text is displayed
      expect(find.text('Appointments Remaining'), findsOneWidget);

      // Verify "5" text is displayed
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('Customer Card Tests', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: CustomerCard(
            text: 'Welcome',
            name: 'Sahil Ketkar',
            visits: '10',
            email: 'sahil@gmail.com',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify "Welcome" text is displayed
      expect(find.text('Welcome'), findsOneWidget);

      // Verify "Sahil Ketkar" text is displayed
      expect(find.text('Sahil Ketkar'), findsOneWidget);

      // Verify "10" text is displayed
      expect(find.text('10'), findsOneWidget);

      // Verify "sahil@gmail.com" text is displayed
      expect(find.text('sahil@gmail.com'), findsOneWidget);
    });

    testWidgets('Appointment Card Tests', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: AppointmentCard(
            title: 'Sahil Ketkar',
            day: '20 Nov',
            time: '11:30 AM',
            petname: 'Sahil',
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify "Sahil Ketkar" text is displayed
      expect(find.text('Sahil Ketkar'), findsOneWidget);

      // Verify "20 Nov" text is displayed
      expect(find.text('20 Nov'), findsOneWidget);

      // Verify "11:30 AM" text is displayed
      expect(find.text('11:30 AM'), findsOneWidget);
    });
  });
}
