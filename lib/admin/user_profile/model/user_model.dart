class UserModel {
  final String name;
  final String profileImageUrl;
  final String age;
  final String gender;
  final String fitnessGoal;
  final String referralCode;
  final int totalReferrals;
  final int premiumMonths;
  final double startingWeight;
  final double presentWeight;
  final double startingChest;
  final double presentChest;
  final double startingHips;
  final double presentHips;
  final double startingWaist;
  final double presentWaist;
  final double startingArms;
  final double presentArms;

  UserModel({
    required this.name,
    required this.profileImageUrl,
    required this.age,
    required this.gender,
    required this.fitnessGoal,
    required this.referralCode,
    required this.totalReferrals,
    required this.premiumMonths,
    required this.startingWeight,
    required this.presentWeight,
    required this.startingChest,
    required this.presentChest,
    required this.startingHips,
    required this.presentHips,
    required this.startingWaist,
    required this.presentWaist,
    required this.startingArms,
    required this.presentArms,
  });
}

class PremiumTierModel {
  final String tierName;
  final double monthlyPrice;
  final List<String> features;
  final DateTime planActivatedDate;
  final DateTime renewalDate;
  final bool isActive;

  PremiumTierModel({
    required this.tierName,
    required this.monthlyPrice,
    required this.features,
    required this.planActivatedDate,
    required this.renewalDate,
    required this.isActive,
  });
}