import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g11_appointment_scheduling/views/signin_screen.dart';

void main() {
  group('LoginScreen UI Tests', () {
    testWidgets('should display all UI elements correctly',
        (WidgetTester tester) async {
      // Build the LoginScreen
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Verify the logo image is displayed
      expect(find.byType(Image), findsOneWidget);

      // Verify "Sign In" text is displayed
      expect(find.text("Sign In"), findsOneWidget);

      // Verify subtitle text is displayed
      expect(
          find.text("Join us and explore the new horizons!"), findsOneWidget);

      // Verify email TextFormField is displayed
      expect(find.byType(TextFormField),
          findsNWidgets(2)); // Two fields: Email and Password

      // Verify Log In button is displayed
      expect(find.text("Log"), findsOneWidget);
    });
  });
}
