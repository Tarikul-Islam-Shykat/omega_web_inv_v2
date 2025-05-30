import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omega_web_inv/User/Views/features/Home/view/home_screen.dart';

class UserInfoSetupController extends GetxController {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final dietaryPreferenceController = TextEditingController();

  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxBool isLoading = false.obs;
  final RxString selectedGender = RxString('');
  final RxString selectedFitnessGoal = RxString('');
  final RxString userName = RxString('');

  @override
  void onInit() {
    super.onInit();
    nameController.addListener(() {
      userName.value = nameController.text;
    });
  }

  Future<void> pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void setGender(String? value) {
    selectedGender.value = value ?? '';
  }

  void setFitnessGoal(String? value) {
    selectedFitnessGoal.value = value ?? '';
  }

  String? validateInputs() {
    if (userName.value.trim().isEmpty) return 'Name is required';
    if (ageController.text.trim().isEmpty) return 'Age is required';
    if (int.tryParse(ageController.text) == null ||
        int.parse(ageController.text) <= 0) {
      return 'Enter a valid age';
    }
    if (weightController.text.trim().isEmpty) return 'Weight is required';
    if (double.tryParse(weightController.text) == null ||
        double.parse(weightController.text) <= 0) {
      return 'Enter a valid weight';
    }
    if (heightController.text.trim().isEmpty) return 'Height is required';
    if (double.tryParse(heightController.text) == null ||
        double.parse(heightController.text) <= 0) {
      return 'Enter a valid height';
    }
    if (selectedGender.value.isEmpty) return 'Gender is required';
    if (selectedFitnessGoal.value.isEmpty) return 'Fitness goal is required';
    return null;
  }

  Future<void> saveProfile() async {
    final error = validateInputs();
    if (error != null) {
      Get.snackbar(
        'Error',
        error,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
      return;
    }

    isLoading.value = true;
    try {
      await Future.delayed(const Duration(seconds: 2));
      Get.off(() => HomeContent());
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save profile: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Provide goal data for cards
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

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    dietaryPreferenceController.dispose();
    super.onClose();
  }
}
