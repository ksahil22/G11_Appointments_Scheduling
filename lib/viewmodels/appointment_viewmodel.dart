import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:g11_appointment_scheduling/constants/const.dart';
import 'package:g11_appointment_scheduling/constants/helper_class.dart';
import 'package:g11_appointment_scheduling/models/appointment_model.dart';
import 'package:g11_appointment_scheduling/models/doctor_model.dart';
import 'package:g11_appointment_scheduling/models/user_model.dart';

class AppointmentViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> bookAppointment(
      String serviceId,
      String date,
      String time,
      String userId,
      String petId,
      String appointmentDate,
      DoctorModel doctorModel) async {
    try {
      String appointmentId =
          await _firestore.collection(Constants.fcAppointments).doc().id;
      UserModel user = await _firestore
          .collection(Constants.fcUsers)
          .doc(userId)
          .get()
          .then((value) =>
              UserModel.fromJson(value.data() as Map<String, dynamic>));

      AppointmentModel appointment = AppointmentModel(
          doctorId: serviceId,
          timeOfBooking: DateTime.now().millisecondsSinceEpoch,
          apptId: appointmentId,
          userId: userId,
          apptTime: time,
          doctorName: doctorModel.doctorName,
          feesStatus: 'pending',
          apptDate: date,
          apptStatus: Constants.appointmentActive,
          username: "${user.firstName} ${user.lastName}");

      await _firestore
          .collection(Constants.fcAppointments)
          .doc(appointmentId)
          .set(appointment.toJson());

      time = HelperClass.reformatHourToModelType(time);
      await _firestore
          .collection(Constants.fcAvailability)
          .doc(serviceId)
          .collection(Constants.fcDates)
          .doc(date)
          .update({
        time: FieldValue.arrayUnion([appointmentId])
      });

      await _firestore.collection(Constants.fcUsers).doc(userId).update({
        'appointments': FieldValue.arrayUnion([appointmentId])
      });

      return "success";
    } catch (e) {
      print(e);
      log(e.toString());
      return "error";
    }
  }

  Future<String> cancelAppointment(AppointmentModel model) async {
    try {
      await _firestore
          .collection(Constants.fcAppointments)
          .doc(model.apptId)
          .update({
        'feesStatus': Constants.appointmentCancelled,
        'apptStatus': Constants.appointmentCancelled
      });

      String formattedTime =
          HelperClass.reformatHourToModelType(model.apptTime);

      await _firestore
          .collection(Constants.fcAvailability)
          .doc(model.doctorId)
          .collection(Constants.fcDates)
          .doc(model.apptDate)
          .update({
        formattedTime: FieldValue.arrayRemove([model.apptId])
      });

      await _firestore.collection(Constants.fcUsers).doc(model.userId).update({
        'appointments': FieldValue.arrayRemove([model.apptId])
      });
      return 'success';
    } catch (e) {
      print(e);
      log(e.toString());
      return 'error';
    }
  }

  Future<String> rescheduleAppointment(AppointmentModel prevAppointmentModel,
      String newDate, String newTime) async {
    try {
      await _firestore
          .collection(Constants.fcAvailability)
          .doc(prevAppointmentModel.doctorId)
          .collection(Constants.fcDates)
          .doc(prevAppointmentModel.apptDate)
          .update({
        HelperClass.reformatHourToModelType(prevAppointmentModel.apptTime):
            FieldValue.arrayRemove([prevAppointmentModel.apptId])
      });

      await _firestore
          .collection(Constants.fcAppointments)
          .doc(prevAppointmentModel.apptId)
          .update({
        'apptDate': newDate,
        'apptTime': newTime,
        'timeOfBooking': DateTime.now().millisecondsSinceEpoch
      });
      await _firestore
          .collection(Constants.fcAvailability)
          .doc(prevAppointmentModel.doctorId)
          .collection(Constants.fcDates)
          .doc(newDate)
          .update({
        HelperClass.reformatHourToModelType(newTime):
            FieldValue.arrayUnion([prevAppointmentModel.apptId])
      });
      return "success";
    } catch (e) {
      log(e.toString());
      return "error";
    }
  }

  Future<void> setPastAppointmentToDone() async {
    try {
      await _firestore
          .collection(Constants.fcAppointments)
          .where('apptStatus', isEqualTo: Constants.appointmentActive)
          .where('apptDate', isLessThan: HelperClass.getTwoDaysBeforeDate())
          .get()
          .then((value) {
        log("got ${value.docs.length} appointments for updating to done");
        value.docs.forEach((element) async {
          log("Updating ${element.id} to completed");
          await _firestore
              .collection(Constants.fcAppointments)
              .doc(element.id)
              .update({'apptStatus': Constants.appointmentCompleted});
        });
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
