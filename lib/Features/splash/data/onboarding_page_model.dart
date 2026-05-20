import 'package:polo/core/resourses/assets.dart';

class OnboardingPageModel {
  final String image;
  final String title;
  final String description;

  OnboardingPageModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(
    image: AppImages.onboarding1,
    title: "Welcome To",
    description: "Pollo Store! The perfect place to purchase veterinary products easily and safely.",
  ),
  OnboardingPageModel(
    image: AppImages.onboarding2,
    title: "All-in-One Veterinary Solution!",
    description: "Manage poultry, livestock, fish, and pets efficiently with a complete farm management solution at your fingertips.",
  ),
  OnboardingPageModel(
    image: AppImages.onboarding3,
    title: "Expert Advice & Veterinary Support!",
    description: "Connect with expert veterinarians for quick guidance to care for your animals and resolve health issues efficiently.",
  ),
];
