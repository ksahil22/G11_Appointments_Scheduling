import 'dart:developer';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:g11_appointment_scheduling/constants/const.dart';

class AdminServiceViewModel {
  // For loading multiple images from assets (Web)
  Future<List<Uint8List>> loadMultipleImagesWeb(List<String> assetPaths) async {
    List<Uint8List> loadedImages = [];

    try {
      for (String path in assetPaths) {
        final Uint8List imageData = await rootBundle
            .load(path)
            .then((data) => data.buffer.asUint8List());
        loadedImages.add(imageData);
      }
      log("Images loaded from assets for web. Count: ${loadedImages.length}");
    } catch (e) {
      print('Error loading multiple images from assets: $e');
    }

    return loadedImages;
  }

  // For uploading multiple files to Firebase Storage (Web)
  Future<List<String>> uploadFilesWeb(
      List<Uint8List> imageFilesWeb, String serviceName) async {
    List<String> downloadUrls = [];

    try {
      for (int i = 0; i < imageFilesWeb.length; i++) {
        Uint8List file = imageFilesWeb[i];
        String fileName = '${i + 1}.png';
        String storageRef =
            '${Constants.fcDoctorPhotos}/$serviceName/$fileName';
        Reference ref = FirebaseStorage.instance.ref(storageRef);
        UploadTask uploadTask = ref.putData(file);

        // Wait until the file is uploaded
        await uploadTask;

        // Get the download URL
        final String downloadURL = await ref.getDownloadURL();
        downloadUrls.add(downloadURL);
      }
    } catch (e) {
      print('Failed to upload files: $e');
    }

    return downloadUrls;
  }

  // For loading multiple images from assets (Mobile)
  Future<List<Uint8List>> loadMultipleImagesMobile(
      List<String> assetPaths) async {
    List<Uint8List> loadedImages = [];

    try {
      for (String path in assetPaths) {
        final Uint8List imageData = await rootBundle
            .load(path)
            .then((data) => data.buffer.asUint8List());
        loadedImages.add(imageData);
      }
      log("Images loaded from assets for mobile. Count: ${loadedImages.length}");
    } catch (e) {
      print('Error loading multiple images from assets: $e');
    }

    return loadedImages;
  }

  Future<List<String>> uploadImagesMobile(
      List<Uint8List> imageData, String serviceName) async {
    List<String> imageUrls = [];

    for (int i = 0; i < imageData.length; i++) {
      Uint8List file = imageData[i];
      String fileName = '${i + 1}.png';
      String storageRef = '${Constants.fcDoctorPhotos}/$serviceName/$fileName';

      TaskSnapshot snapshot =
          await FirebaseStorage.instance.ref(storageRef).putData(file);

      String downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }

    return imageUrls;
  }

  // For uploading images with custom reference paths (Web)
  Future<List<String>> uploadFilesWebWithRef(
      List<Uint8List> imageFilesWeb, String storageRef) async {
    List<String> downloadUrls = [];

    try {
      for (int i = 0; i < imageFilesWeb.length; i++) {
        Uint8List file = imageFilesWeb[i];
        String fileName = '${i + 1}.png';

        Reference ref = FirebaseStorage.instance.ref('$storageRef/$fileName');
        UploadTask uploadTask = ref.putData(file);

        await uploadTask;
        final String downloadURL = await ref.getDownloadURL();
        downloadUrls.add(downloadURL);
      }
    } catch (e) {
      print('Failed to upload files: $e');
    }

    return downloadUrls;
  }

  // For uploading a single image file (Web)
  Future<String> uploadSingleFileWeb(Uint8List file, String storageRef) async {
    String downloadUrl = '';

    try {
      Reference ref = FirebaseStorage.instance.ref(storageRef);
      UploadTask uploadTask = ref.putData(file);

      await uploadTask;
      downloadUrl = await ref.getDownloadURL();
    } catch (e) {
      print('Failed to upload file: $e');
    }

    return downloadUrl;
  }

  Future<List<String>> uploadImagesMobileWithRef(
      List<Uint8List> imageData, String storageRef) async {
    List<String> imageUrls = [];

    for (int i = 0; i < imageData.length; i++) {
      Uint8List file = imageData[i];
      String fileName = '${i + 1}.png';

      TaskSnapshot snapshot = await FirebaseStorage.instance
          .ref('$storageRef/$fileName')
          .putData(file);

      String downloadUrl = await snapshot.ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }

    return imageUrls;
  }

  // For loading a single image from assets (Web)
  Future<Uint8List> loadSingleImageWeb(String assetPath) async {
    Uint8List selectedImage = Uint8List(0);

    try {
      selectedImage = await rootBundle
          .load(assetPath)
          .then((data) => data.buffer.asUint8List());
      log("Single image loaded from assets for web. Size: ${selectedImage.length}");
    } catch (e) {
      print('Error loading single image from assets: $e');
    }

    return selectedImage;
  }
}
