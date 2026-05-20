import 'package:flutter/material.dart';
import '../../Features/splash/presention/splash/presention/views/onboarding_view.dart';
import '../../Features/splash/presention/splash/presention/views/splash_view.dart';
import '../../Features/Authentication/presentation/views/forget_password_view.dart';
import '../../Features/Authentication/presentation/views/reset_password_view.dart';
import '../../Features/Authentication/presentation/views/sign_in_view.dart';
import '../../Features/Authentication/presentation/views/sign_up_view.dart';
import '../../Features/Authentication/presentation/views/verfifcation_password_view.dart';
import '../../Features/Home/presentation/views/main_shell_view.dart';
import '../../Features/Categories/presentation/views/categories_view.dart';
import '../../Features/Categories/presentation/views/sub_categories_view.dart';
import '../../Features/Products/presentation/views/products_list_view.dart';
import '../../Features/Products/presentation/views/product_details_view.dart';
import '../../Features/Search/presentation/views/search_view.dart';
import '../../Features/Favorites/presentation/views/favorites_view.dart';
import '../../Features/Ads/presentation/views/add_ad_view.dart';
import '../../Features/Account/presentation/views/account_view.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const forgetPassword = '/forgetPassword';
  static const verification = '/verification';
  static const resetPassword = '/resetPassword';
  static const home = '/home';
  static const categories = '/categories';
  static const subCategories = '/subCategories';
  static const products = '/products';
  static const productDetails = '/productDetails';
  static const search = '/search';
  static const favorites = '/favorites';
  static const addAd = '/addAd';
  static const account = '/account';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );

      case onboarding:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );

      case signIn:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
        );

      case signUp:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );

      case forgetPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordView(),
        );

      case verification:
        return MaterialPageRoute(
          builder: (_) => const VerificationView(),
        );

      case resetPassword:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordView(),
        );

      case home:
        return MaterialPageRoute(
          builder: (_) => const MainShellView(),
        );

      case categories:
        return MaterialPageRoute(
          builder: (_) => const CategoriesView(),
        );

      case subCategories:
        return MaterialPageRoute(
          builder: (_) => const SubCategoriesView(),
        );

      case products:
        return MaterialPageRoute(
          builder: (_) => const ProductsListView(),
        );

      case productDetails:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsView(),
        );

      case search:
        return MaterialPageRoute(
          builder: (_) => const SearchView(),
        );

      case favorites:
        return MaterialPageRoute(
          builder: (_) => const FavoritesView(),
        );

      case addAd:
        return MaterialPageRoute(
          builder: (_) => const AddAdView(),
        );

      case account:
        return MaterialPageRoute(
          builder: (_) => const AccountView(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
    }
  }
}
