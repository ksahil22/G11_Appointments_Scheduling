import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g11_appointment_scheduling/admin_views/add_new_doctor_screen_admin.dart';

void main() {
  group('Add New Doctor Screen UI Widget Tests', () {
    testWidgets('should display all UI elements correctly',
        (WidgetTester tester) async {
      // Build the LoginScreen
      await tester.pumpWidget(const MaterialApp(home: AddNewDoctorScreen()));

      // Verify Title
      expect(find.text('Add Doctor\'s detail'), findsOneWidget);

      // Verify number of text fields
      expect(find.byType(TextFormField), findsNWidgets(8));

      // Verify "Doctor name" text field
      expect(find.text('Doctor Name'), findsOneWidget);

      // Verify "Doctor's complete detail" text field
      expect(find.text('Doctor\'s complete detail'), findsOneWidget);

      // Verify "Doctor Fees" text field
      expect(find.text("Doctor Fees"), findsOneWidget);

      // Verify "Doctor speciality" text field
      expect(find.text("Doctor speciality"), findsOneWidget);

      // Verify "Address" text field
      expect(find.text("Address"), findsOneWidget);

      // Verify "Appointment Count" text field
      expect(find.text("Appointment Count"), findsOneWidget);

      // Verify "Year of experience" text field
      expect(find.text("Year of experience"), findsOneWidget);

      // Verify "Added hours" text field
      expect(find.text("Added hours"), findsOneWidget);

      // Verify "Visiting hours" text field
      expect(find.text("Visiting hours"), findsOneWidget);

      // Verify "Add Hour" text field
      expect(find.text("Add Hour"), findsOneWidget);

      // Verify "Add Photos" text field
      expect(find.text("Add Photos"), findsOneWidget);

      // Verify "Submit" text field
      expect(find.text("Submit"), findsOneWidget);
    });
  });
}
