import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omega_web_inv/feature/user/bottom_nav_bar/screen/custom_bottom_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/global_widegts/app_snackbar.dart';
import '../../../../core/repository/network_caller/endpoints.dart';
import '../../../../core/repository/services_class/local_service/local_servies.dart';
import '../../home/controller/custom_dropdown_controller.dart';
import 'package:http/http.dart' as http;

import '../../home/view/home_screen.dart';



class UserInfoSetupController extends GetxController {
  // Controllers for text fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController dietaryPreferenceController = TextEditingController();
  final CustomDropDownController dropdownController = CustomDropDownController();

  // Reactive state variables
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxBool isLoading = false.obs;


  final RxString userName = ''.obs;


  @override
  void onInit() {
    super.onInit();
    // Update userName whenever nameController changes
    nameController.addListener(
          () => userName.value = nameController.text.trim(),
    );
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      _showErrorSnackbar('Failed to pick image', e.toString());
    }
  }

  void setGender(String? value) => selectedGender.value = value ?? '';
  void setFitnessGoal(String? value) => selectedFitnessGoal.value = value ?? '';

  String? validateInputs() {
    if (userName.value.isEmpty) return 'Name is required';

    if (ageController.text.trim().isEmpty) return 'Age is required';
    final age = int.tryParse(ageController.text);
    if (age == null || age <= 0) return 'Enter a valid age';

    if (weightController.text.trim().isEmpty) return 'Weight is required';
    final weight = double.tryParse(weightController.text);
    if (weight == null || weight <= 0) return 'Enter a valid weight';

    if (heightController.text.trim().isEmpty) return 'Height is required';
    final height = double.tryParse(heightController.text);
    if (height == null || height <= 0) return 'Enter a valid height';

    if (selectedGender.value.isEmpty) return 'Gender is required';
    if (selectedFitnessGoal.value.isEmpty) return 'Fitness goal is required';

    return null;
  }

  Future<void> saveProfile() async {
    final error = validateInputs();
    if (error != null) {
      _showErrorSnackbar('Error', error);
      return;
    }

    isLoading.value = true;
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));
      Get.off(() => HomeContent());
    } catch (e) {
      _showErrorSnackbar('Failed to save profile', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  List<Map<String, dynamic>> getGoalData() {
    return [
      {
        'title': 'Weight',
        'value':
        weightController.text.isEmpty
            ? 'N/A'
            : '${weightController.text} kg',
        'icon': Icons.fitness_center,
      },
      {
        'title': 'Height',
        'value':
        heightController.text.isEmpty
            ? 'N/A'
            : '${heightController.text} cm',
        'icon': Icons.height,
      },
      {
        'title': 'Goal',
        'value':
        selectedFitnessGoal.value.isEmpty
            ? 'N/A'
            : selectedFitnessGoal.value,
        'icon': Icons.flag,
      },
    ];
  }

  void _showErrorSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }




  final RxString selectedGender = ''.obs;

  final RxList<String> gender = <String>[
    'Male',
    'Female',
  ].obs;
  void onSetGender(String value) {
    selectedGender.value = value.trim();
    print("Selected fitness goal: ${selectedGender.value}"); //// Trim any accidental space
  }


  final RxString selectedFitnessGoal = ''.obs;
  RxList<String> fitnessGoal = <String>[
    'Lose Weight',
    'Gain Muscle',
    'Stay Healthy',
    'Other',
  ].obs;

  void onSetFitnessGoal(String v) {
    selectedFitnessGoal.value = v.trim();
    print("Selected fitness goal: ${selectedFitnessGoal.value}"); //
  }








  ///user setup profile
  final _picker = ImagePicker();
  var isUploading = false.obs;
  var errorMessage = ''.obs;
  var uploadProgress = 0.0.obs;
  var imageSizeText = ''.obs;
  Rx<File?> profileImage = Rx<File?>(null);
  // Pick profile image from gallery
  Future<void> pickProfileImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        // Compress the image
        File? compressedImage = await _compressImage(imageFile);

        if (compressedImage != null) {
          profileImage.value = compressedImage;
          await _updateImageSizeText(compressedImage);
          errorMessage.value = '';
          AppSnackbar.show(
            message: "Profile picture selected successfully",
            isSuccess: true,
          );
        } else {
          errorMessage.value = 'Failed to compress image';
        }
      }
    } catch (e) {
      log("Error picking profile image: $e");
      errorMessage.value = 'Failed to select image: ${e.toString()}';
    }
  }

  // Pick profile image from camera
  Future<void> pickProfileImageFromCamera() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);

        // Compress the image
        File? compressedImage = await _compressImage(imageFile);

        if (compressedImage != null) {
          profileImage.value = compressedImage;
          await _updateImageSizeText(compressedImage);
          errorMessage.value = '';
          AppSnackbar.show(
            message: "Profile picture captured successfully",
            isSuccess: true,
          );
        } else {
          errorMessage.value = 'Failed to compress image';
        }
      }
    } catch (e) {
      log("Error capturing profile image: $e");
      errorMessage.value = 'Failed to capture image: ${e.toString()}';
    }
  }

  // Compress image to meet size requirements
  Future<File?> _compressImage(File imageFile) async {
    try {
      // Get file size before compression
      int originalSize = await imageFile.length();
      log("Original image size: ${(originalSize / 1024).toStringAsFixed(2)} KB");

      // If image is already under 250KB, return as is
      if (originalSize <= 250 * 1024) {
        return imageFile;
      }

      // Compress image
      String targetPath = imageFile.path
          .replaceAll('.jpg', '_compressed.jpg')
          .replaceAll('.jpeg', '_compressed.jpeg')
          .replaceAll('.png',
          '_compressed.jpg'); // Convert PNG to JPG for better compression

      Uint8List? compressedBytes = await FlutterImageCompress.compressWithFile(
        imageFile.absolute.path,
        minWidth: 800, // Maximum width
        minHeight: 800, // Maximum height
        quality: 85, // Start with 85% quality
        format: CompressFormat.jpeg,
      );

      if (compressedBytes == null) {
        log("Failed to compress image");
        return null;
      }

      // If still too large, try with lower quality
      int currentSize = compressedBytes.length;
      int quality = 85;

      while (currentSize > 250 * 1024 && quality > 50) {
        quality -= 10;
        log("Trying with quality: $quality");

        compressedBytes = await FlutterImageCompress.compressWithFile(
          imageFile.absolute.path,
          minWidth: 600,
          minHeight: 600,
          quality: quality,
          format: CompressFormat.jpeg,
        );

        if (compressedBytes != null) {
          currentSize = compressedBytes.length;
        } else {
          break;
        }
      }

      if (compressedBytes == null) {
        log("Failed to compress image to required size");
        return null;
      }

      // Write compressed image to file
      File compressedFile = File(targetPath);
      await compressedFile.writeAsBytes(compressedBytes);

      int finalSize = compressedBytes.length;
      log("Compressed image size: ${(finalSize / 1024).toStringAsFixed(2)} KB");

      return compressedFile;
    } catch (e) {
      log("Error compressing image: $e");
      return null;
    }
  }

  // Update image size text for display
  Future<void> _updateImageSizeText(File imageFile) async {
    try {
      int sizeInBytes = await imageFile.length();
      double sizeInKB = sizeInBytes / 1024;

      if (sizeInKB < 1024) {
        imageSizeText.value = "${sizeInKB.toStringAsFixed(1)} KB";
      } else {
        double sizeInMB = sizeInKB / 1024;
        imageSizeText.value = "${sizeInMB.toStringAsFixed(1)} MB";
      }
    } catch (e) {
      imageSizeText.value = "Size unknown";
    }
  }


  // Upload profile picture
  Future<bool> uploadProfilePicture() async {
    if (profileImage.value == null) {
      errorMessage.value = 'Please select a profile picture';
      AppSnackbar.show(message: 'Please select a profile picture', isSuccess: false);
      return false;
    }
    if (nameController.text.isEmpty ||
        ageController.text.isEmpty ||
        selectedGender.value.isEmpty ||
        weightController.text.isEmpty ||
        heightController.text.isEmpty ||
        selectedFitnessGoal.value.isEmpty) {
      errorMessage.value = 'Please fill all required fields';
      AppSnackbar.show(message: 'Please fill all required fields', isSuccess: false);
      return false;
    }

    try {
      isUploading.value = true;
      errorMessage.value = '';
      uploadProgress.value = 0.0;

      final request = http.MultipartRequest(
        'POST', // Using PUT as shown in your Postman screenshot
        Uri.parse(Urls.userInfoCreate),
      );

      SharedPreferences sh = await SharedPreferences.getInstance();
      var  localService =  LocalService();
      var token = await localService.getToken();
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': "$token",
      });

      // Create the JSON data for the data field
      Map<String, dynamic> userData = {
        "fullName":nameController.text,
        "age":int.parse(ageController.text),
        "gender": selectedGender.value.toUpperCase(),
        "weight":double.parse(weightController.text),
        "height":double.parse(heightController.text),
        "fitnessGoal": selectedFitnessGoal.value,
        "dietaryPreference":dietaryPreferenceController.text,
      };
      log("user response data $userData");
      log("token $token");

      // Add the data field as JSON string
      request.fields['data'] = json.encode(userData);

      // Add the image file
      var imageBytes = await profileImage.value!.readAsBytes();
      var multipartFile = http.MultipartFile.fromBytes(
        'image',
        imageBytes,
        filename: 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      request.files.add(multipartFile);

      // Send request with progress tracking
      var streamedResponse = await request.send();

      // Simulate progress for better UX
      for (int i = 0; i <= 100; i += 10) {
        uploadProgress.value = i.toDouble();
        await Future.delayed(Duration(milliseconds: 50));
      }

      final response = await http.Response.fromStream(streamedResponse);
      final responseJson = json.decode(response.body);

      log("Profile picture add response: $responseJson");
      log("Status code: ${response.statusCode}");

      if ((response.statusCode == 200 || response.statusCode == 201) &&
          responseJson['success'] == true) {
        AppSnackbar.show(
          message: "Profile picture add successfully!",
          isSuccess: true,
        );
        Get.to(()=>BottomNavBarScreen());
        onClose();
        return true;
      } else {
        errorMessage.value = responseJson['message'] ?? 'Upload failed';
        AppSnackbar.show(message: responseJson['message'], isSuccess: false);
        log("Upload failed: ${responseJson['message']}");
        return false;
      }
    } catch (e) {
      log("Profile picture add error: $e");
      errorMessage.value = 'Upload failed: ${e.toString()}';
      return false;
    } finally {
      isUploading.value = false;
    }
  }





  @override
  void onClose() {
    nameController.clear();
    ageController.clear();
    weightController.clear();
    heightController.clear();
    dietaryPreferenceController.clear();
    selectedImage.value =null;
    selectedFitnessGoal.value.isEmpty;
    selectedGender.value.isEmpty;
    super.onClose();
  }

}
