import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g11_appointment_scheduling/views/home_screen.dart';

void main() {
  group('Home Screen UI Widget Tests', () {
    testWidgets('should display all UI elements correctly',
        (WidgetTester tester) async {
      // Build the LoginScreen
      await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

      // Verify Title
      expect(find.text('MediSchedule'), findsOneWidget);

      // Verify the logo image is displayed
      expect(find.byType(Image), findsOneWidget);

      // Verify "Your heart's\nBestfriend!" tagline text is displayed
      expect(find.text("Your heart's\nBestfriend!"), findsOneWidget);

      // Verify Book Appointment Button is displayed
      expect(find.text("Book Appointment"), findsOneWidget);

      // Doctors panel
      // Verify title text is displayed
      expect(find.text("Doctors"), findsOneWidget);
      // Verify View all text is displayed
      expect(find.text("View all"), findsOneWidget);

      // Upcoming appointments panel
      expect(find.text("Upcoming appointments"), findsOneWidget);
    });
  });
}
