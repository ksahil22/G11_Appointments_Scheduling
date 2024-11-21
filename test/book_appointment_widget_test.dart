import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:g11_appointment_scheduling/models/doctor_model.dart';
import 'package:g11_appointment_scheduling/views/service_detail_screen.dart';
import 'package:intl/intl.dart';

void main() {
  group('Widget Test', () {
    late MockFirebaseAuth mockAuth;
    late FakeFirebaseFirestore mockFirestore;

    setUp(() async {
      // Initialize mock services
      mockAuth = MockFirebaseAuth(
        signedIn: true,
        mockUser: MockUser(
          uid: 'testUser',
          email: 'test@example.com',
          displayName: 'Test User',
        ),
      );
      mockFirestore = FakeFirebaseFirestore();
    });

    testWidgets('HomeScreen displays welcome message and reminders',
        (WidgetTester tester) async {
      // Build the widget and pump it into the widget tree
      DoctorModel model = DoctorModel(
        about: 'MBBSMD - General MedicineDNB - Cardiology',
        address: 'Rosdroppath',
        appointmentsInHourCount: 1,
        doctorExperience: '23',
        doctorFees: 200,
        doctorId: 'GVs6ziopPr3SsXTRSl5F',
        doctorName: 'John Doe',
        doctorPhotos: [
          "https://firebasestorage.googleapis.com/v0/b/pulsewell-f58a7.appspot.com/o/doctorPhotos%2FDr.%20Hemant%20Pathare%2F2.png?alt=media&token=62641894-67c7-4efb-a9e3-9c6738b351ea",
          "https://firebasestorage.googleapis.com/v0/b/pulsewell-f58a7.appspot.com/o/doctorPhotos%2FDr.%20Hemant%20Pathare%2F1.png?alt=media&token=5fdf2033-d3f1-4dbe-8806-c7bcf199ef57"
        ],
        hours: ['12', '13'],
        doctorSpeciality: 'MBBS,MD,DNB',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: ServicesDetailScreen(
            firebaseAuth: mockAuth,
            firebaseFirestore: mockFirestore,
            serviceModel: model,
            serviceId: 'abcdxyz',
          ),
        ),
      );
      // Allow time for async operations to complete
      await tester.pumpAndSettle();

      // Verify Title
      // Test for Medication Name TextField
      final titleText = find.widgetWithText(AppBar, 'Book Appointment');
      expect(titleText, findsOneWidget);

      // Verify that the AppBar displays the correct title.
      expect(find.text(model.doctorName), findsOneWidget);

      // Verify the doctor specific information
      expect(find.text('\$ ' + model.doctorFees.toString()), findsOneWidget);
      expect(find.text('About service'), findsOneWidget);
      expect(find.text(model.about), findsOneWidget);
      expect(find.text('Dates'), findsOneWidget);
      expect(find.text(model.about), findsOneWidget);

      // Verify the date grid for date selection
      int monthCount1 = 0;
      int monthCount2 = 0;
      String formattedDateMonth1 = DateFormat('MMM').format(DateTime.now());
      String formattedDateMonth2 = '';
      for (int i = 0; i < 11; i++) {
        String formattedDateDay =
            DateFormat('dd').format(DateTime.now().add(Duration(days: i)));
        if (formattedDateMonth1 ==
            DateFormat('MMM').format(DateTime.now().add(Duration(days: i)))) {
          monthCount1++;
        } else {
          formattedDateMonth2 =
              DateFormat('MMM').format(DateTime.now().add(Duration(days: i)));
          monthCount2++;
        }
        expect(find.text(formattedDateDay), findsOneWidget);
      }
      expect(find.text(formattedDateMonth1), findsNWidgets(monthCount1));
      expect(find.text(formattedDateMonth2), findsNWidgets(monthCount2));

      expect(find.text('Select Time'), findsOneWidget);
      expect(find.text('Booked'), findsOneWidget);
      expect(find.text('Available'), findsOneWidget);

      // Verify Book Appointment Button
      final submitButton =
          find.widgetWithText(ElevatedButton, 'Book Appointment');
      expect(submitButton, findsOneWidget);
    });
  });
}
