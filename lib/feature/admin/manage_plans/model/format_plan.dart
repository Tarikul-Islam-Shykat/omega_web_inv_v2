import 'package:flutter/material.dart';

class FormatPlanModel {
  final String title;
  final String price;
  final List<String> features;
  final Color cardColor;
  final bool hasCrown;
  bool isSelected;

  FormatPlanModel({
    required this.title,
    required this.price,
    required this.features,
    required this.cardColor,
    this.hasCrown = false,
    this.isSelected = false,
  });
}

class SavePlanFeature {
  final String feature;
  bool isSelected;

  SavePlanFeature({
    required this.feature,
    this.isSelected = false,
  });
}