import 'package:flutter/material.dart';
import 'package:g11_appointment_scheduling/constants/text_const.dart';

class AddNewDoctorScreen extends StatefulWidget {
  const AddNewDoctorScreen({super.key});

  @override
  State<AddNewDoctorScreen> createState() => _AddNewDoctorScreenState();
}

class _AddNewDoctorScreenState extends State<AddNewDoctorScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _doctorNameController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();
  final TextEditingController _doctorSpecialityController =
      TextEditingController();
  final TextEditingController _doctorExperienceController =
      TextEditingController();
  final TextEditingController _doctorFeesController = TextEditingController();
  final TextEditingController _currentHourController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _appointmentInHoursCountController =
      TextEditingController();
  final List<String> _visitingHours = [];
  final List<String> imagePaths = [];

  @override
  void dispose() {
    _doctorNameController.dispose();
    _aboutController.dispose();
    _doctorSpecialityController.dispose();
    _doctorExperienceController.dispose();
    _doctorFeesController.dispose();
    _currentHourController.dispose();
    _addressController.dispose();
    _appointmentInHoursCountController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Doctor's detail", style: kSubHeadingTextStyle),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _doctorNameController,
                  decoration: const InputDecoration(labelText: 'Doctor Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Doctors name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _aboutController,
                  decoration: const InputDecoration(
                      labelText: 'Doctor\'s complete detail:'),
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter doctor\'s complete description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _doctorFeesController,
                  decoration: const InputDecoration(labelText: 'Doctor Fees'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Doctor fees';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _doctorSpecialityController,
                  decoration:
                      const InputDecoration(labelText: 'Doctor speciality'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Doctor speciality';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Doctor address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _appointmentInHoursCountController,
                  decoration:
                      const InputDecoration(labelText: 'Appointment Count'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Number of appointment available in one hour';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _doctorExperienceController,
                  decoration:
                      const InputDecoration(labelText: 'Year of experience'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Doctor year of experience';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text("Added hours"),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _visitingHours.length,
                    itemBuilder: (context, index) {
                      return Text(_visitingHours[index]);
                    },
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _currentHourController,
                  decoration:
                      const InputDecoration(labelText: 'Visiting hours'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Doctor fees';
                    }
                    if (int.tryParse(value)! > 24 || int.tryParse(value)! < 0) {
                      return 'Please enter a valid hour number between 0 - 23';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _visitingHours.add(_currentHourController.text);
                    });
                  },
                  child: const Text('Add Hour'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add Photos'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
