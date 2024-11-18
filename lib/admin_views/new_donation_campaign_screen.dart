import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/color_const.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class NewDonationCampaignScreen extends StatefulWidget {
  const NewDonationCampaignScreen({Key? key}) : super(key: key);

  @override
  State<NewDonationCampaignScreen> createState() =>
      _NewDonationCampaignScreenState();
}

class _NewDonationCampaignScreenState extends State<NewDonationCampaignScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _patientNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _diseaseController = TextEditingController();
  TextEditingController _deadlineController = TextEditingController();
  TextEditingController _amountRequiredController = TextEditingController();
  TextEditingController _consultingDoctorController = TextEditingController();
  TextEditingController _hospitalNameController = TextEditingController();
  List<String> _prescriptionImages = [];
  List<String> _patientImages = [];
  final List<Uint8List> _prescriptionImageFilesWeb = [];
  final List<String> _prescriptionImagePath = [];
  final List<Uint8List> _patientImageFilesWeb = [];
  final List<String> _patientImagePath = [];
  bool _isLoading = false;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _patientNameController.dispose();
    _descriptionController.dispose();
    _diseaseController.dispose();
    _deadlineController.dispose();
    _amountRequiredController.dispose();
    _consultingDoctorController.dispose();
    _hospitalNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: primaryBlueSoftenCustomColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "New Donation Campaign",
          style: kMainTitleBoldTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _patientNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: TealLightCustomColor,
                      labelStyle: kSmallParaTextStyle,
                      labelText: 'Patient Name',
                      border: InputBorder.none, // Remove the border
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter patient name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                      labelText: 'Description of Condition',
                      labelStyle: kSmallParaTextStyle,
                      filled: true,
                      fillColor: TealLightCustomColor,
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter description';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _diseaseController,
                    decoration: InputDecoration(
                      labelText: 'Disease',
                      labelStyle: kSmallParaTextStyle,
                      filled: true,
                      fillColor: TealLightCustomColor,
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter disease';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _deadlineController,
                    decoration: InputDecoration(
                      labelText: 'Deadline',
                      labelStyle: kSmallParaTextStyle,
                      filled: true,
                      fillColor: TealLightCustomColor,
                      border: InputBorder.none,
                    ),
                    onTap: () => {},
                  ),
                ),
                SizedBox(height: 16),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _amountRequiredController,
                    decoration: InputDecoration(
                      labelText: 'Amount Required',
                      labelStyle: kSmallParaTextStyle,
                      filled: true,
                      fillColor: TealLightCustomColor,
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter amount required';
                      }
                      if (int.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _consultingDoctorController,
                    decoration: InputDecoration(
                      labelText: 'Consulting Doctor Name',
                      labelStyle: kSmallParaTextStyle,
                      filled: true,
                      fillColor: TealLightCustomColor,
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter consulting doctor name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                ClipPath(
                  clipper: ShapeBorderClipper(
                    shape: ContinuousRectangleBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        side: BorderSide(
                          color: softGrayStrokeCustomColor,
                          width: 2,
                        )),
                  ),
                  child: TextFormField(
                    controller: _hospitalNameController,
                    decoration: InputDecoration(
                      labelText: 'Hospital Name',
                      labelStyle: kSmallParaTextStyle,
                      filled: true,
                      fillColor: TealLightCustomColor,
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter hospital name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  // width: 160,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          TealCustomButtonlightColor, // Your desired color
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Add Prescription Images',
                      style: kSmallParaTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          TealCustomButtonlightColor, // Your desired color
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'Add Patient Image',
                      style: kSmallParaTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: _isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            'Submit',
                            style: kSmallParaTextStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          TealCustomButtonlightColor, // Your desired color
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      // fixedSize: Size.fromHeight(58), // Your desired height
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
