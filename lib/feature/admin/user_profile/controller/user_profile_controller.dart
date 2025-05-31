import 'package:get/get.dart';
import 'package:prettyrini/feature/admin/user_profile/model/user_model.dart';

class UserProfileController extends GetxController {
  final Rx<UserModel> _user = UserModel(
    name: "Jenny Wilson",
    profileImageUrl: "assets/images/profile.jpg", // placeholder
    age: "21/04/1980",
    gender: "Female",
    fitnessGoal: "Lose Weight, Build Muscle",
    referralCode: "225674",
    totalReferrals: 2,
    premiumMonths: 1,
    startingWeight: 98,
    presentWeight: 98,
    startingChest: 98,
    presentChest: 98,
    startingHips: 98,
    presentHips: 98,
    startingWaist: 98,
    presentWaist: 98,
    startingArms: 98,
    presentArms: 98,
  ).obs;

  final Rx<PremiumTierModel> _premiumTier = PremiumTierModel(
    tierName: "Premium Tier",
    monthlyPrice: 9.99,
    features: [
      "Full workout library",
      "AI-personalized plans",
      "Full fitness + nutrition tracking",
      "Health app integrations",
      "Supplement recommendations + links",
      "Priority support"
    ],
    planActivatedDate: DateTime(2025, 4, 29),
    renewalDate: DateTime(2025, 5, 29),
    isActive: true,
  ).obs;

  UserModel get user => _user.value;
  PremiumTierModel get premiumTier => _premiumTier.value;

  void updateUser(UserModel newUser) {
    _user.value = newUser;
  }

  void updatePremiumTier(PremiumTierModel newTier) {
    _premiumTier.value = newTier;
  }

  String getFormattedDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}";
  }
}
