import 'dart:ui';

class PlanModel {
  final String title;
  final String? subtitle;
  final String? price;
  final List<String> features;
  final String buttonText;
  final Color cardColor;
  final Color buttonColor;
  final Color buttonTextColor;
  final bool hasCrown;

  PlanModel({
    required this.title,
    this.subtitle,
    this.price,
    required this.features,
    required this.buttonText,
    required this.cardColor,
    required this.buttonColor,
    required this.buttonTextColor,
    this.hasCrown = false,
  });
}