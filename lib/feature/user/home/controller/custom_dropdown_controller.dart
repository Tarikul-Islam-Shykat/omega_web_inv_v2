import 'package:get/get.dart';

class CustomDropDownController extends GetxController {
  final RxString selectedValue = RxString(
    '',
  ); // Non-null, empty string as default
  final RxMap<String, bool> checkboxStates = RxMap<String, bool>({});

  final RxBool showDropdown = false.obs;

  void toggleDropdown() {
    showDropdown.value = !showDropdown.value;
  }

  void hideDropdown() {
    showDropdown.value = false;
  }

  // Initialize items and set initial value
  void initializeItems(List<String> items, String? initialValue) {
    // Only clear and reinitialize if items have changed
    if (checkboxStates.keys.toSet() != items.toSet()) {
      checkboxStates.clear();
      for (var item in items) {
        checkboxStates[item] = item == initialValue;
      }
    }
    // Set selectedValue only if initialValue is valid (in items or null)
    if (initialValue == null || items.contains(initialValue)) {
      selectedValue.value = initialValue ?? '';
    }
  }

  // Update selected value and checkbox states
  void setSelectedValue(String? value) {
    // Update selectedValue only if value is null or valid
    if (value == null) {
      selectedValue.value = '';
    } else {
      selectedValue.value = value;
    }
    // Update checkbox states
    checkboxStates.forEach((key, _) {
      checkboxStates[key] = key == value;
    });
  }
}
