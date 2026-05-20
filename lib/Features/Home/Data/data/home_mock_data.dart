import 'package:flutter/material.dart';
import 'package:polo/core/resourses/assets.dart';
import '../models/category_model.dart';

class HomeMockData {
  HomeMockData._();

  static const List<BannerModel> banners = [
    BannerModel(
      image: AppImages.promoVet,
      title: 'The best\nveterinary doctors',
    ),
    BannerModel(
      image: AppImages.promoFarm,
      title: 'All-in-One\nVeterinary Solution',
    ),
  ];

  static const List<CategoryModel> categories = [
    CategoryModel(
      id: 'pharma',
      title: 'Pharmaceutical',
      icon: Icons.medical_services_outlined,
    ),
    CategoryModel(
      id: 'vet_pharma',
      title: 'Vet Pharmacy',
      icon: Icons.medication_outlined,
    ),
    CategoryModel(
      id: 'cattle',
      title: 'Cattle',
      icon: Icons.pets_outlined,
    ),
    CategoryModel(
      id: 'milk',
      title: 'Milk',
      icon: Icons.water_drop_outlined,
    ),
    CategoryModel(
      id: 'chicken',
      title: 'Baby Chicken',
      icon: Icons.egg_outlined,
    ),
    CategoryModel(
      id: 'pets',
      title: 'Pet Animals',
      icon: Icons.cruelty_free_outlined,
    ),
  ];

  static const List<SubCategoryModel> availableServices = [
    SubCategoryModel(
      id: 'pet_animals',
      title: 'Pet Animals',
      image: AppImages.petCategory,
      categoryId: 'pets',
    ),
    SubCategoryModel(
      id: 'large_animals',
      title: 'Large Animals',
      image: AppImages.cattleCategory,
      categoryId: 'cattle',
    ),
    SubCategoryModel(
      id: 'poultry',
      title: 'Poultry',
      image: AppImages.poultryCategory,
      categoryId: 'chicken',
    ),
    SubCategoryModel(
      id: 'pharma_shop',
      title: 'Pharma Shop',
      image: AppImages.promoFarm,
      categoryId: 'pharma',
    ),
    SubCategoryModel(
      id: 'vet_medicine',
      title: 'Vet Medicine',
      image: AppImages.promoVet,
      categoryId: 'vet_pharma',
    ),
    SubCategoryModel(
      id: 'dairy_products',
      title: 'Dairy Products',
      image: AppImages.promoFarm,
      categoryId: 'milk',
    ),
  ];

  static List<SubCategoryModel> subCategoriesFor(String categoryId) {
    return availableServices
        .where((s) => s.categoryId == categoryId)
        .toList();
  }

  static List<ProductModel> products = [
    const ProductModel(
      id: 'p1',
      title: 'Premium Cat Food 5kg',
      image: AppImages.petCategory,
      price: 249.99,
      description:
          'High-quality nutrition for adult cats. Rich in protein and essential vitamins for healthy growth and shiny coat.',
      categoryId: 'pets',
      subCategoryId: 'pet_animals',
      rating: 4.8,
      reviews: 124,
    ),
    const ProductModel(
      id: 'p2',
      title: 'Veterinary Antibiotic',
      image: AppImages.promoVet,
      price: 89.50,
      description:
          'Professional grade antibiotic for livestock. Prescription may be required.',
      categoryId: 'pharma',
      subCategoryId: 'pharma_shop',
      rating: 4.6,
      reviews: 56,
    ),
    const ProductModel(
      id: 'p3',
      title: 'Organic Milk Formula',
      image: AppImages.promoFarm,
      price: 45.00,
      description:
          'Organic milk supplement for calves. Supports healthy digestion and growth.',
      categoryId: 'milk',
      rating: 4.7,
      reviews: 89,
    ),
    const ProductModel(
      id: 'p4',
      title: 'Poultry Vitamin Mix',
      image: AppImages.poultryCategory,
      price: 32.99,
      description:
          'Complete vitamin and mineral supplement for baby chickens and poultry.',
      categoryId: 'chicken',
      subCategoryId: 'poultry',
      rating: 4.5,
      reviews: 42,
      isFavorite: true,
    ),
    const ProductModel(
      id: 'p5',
      title: 'Cattle Health Kit',
      image: AppImages.promoVet,
      price: 199.00,
      description:
          'Essential health monitoring kit for cattle farms including thermometer and supplies.',
      categoryId: 'cattle',
      subCategoryId: 'large_animals',
      rating: 4.9,
      reviews: 31,
    ),
    const ProductModel(
      id: 'p6',
      title: 'Pet Grooming Set',
      image: AppImages.petCategory,
      price: 59.99,
      description:
          'Complete grooming kit for dogs and cats. Includes brush, nail clipper, and shampoo.',
      categoryId: 'pets',
      subCategoryId: 'pet_animals',
      rating: 4.4,
      reviews: 78,
    ),
    const ProductModel(
      id: 'p7',
      title: 'Vet Pharmacy Antiseptic',
      image: AppImages.promoVet,
      price: 28.50,
      description:
          'Broad-spectrum antiseptic solution for wound care in veterinary practice.',
      categoryId: 'vet_pharma',
      subCategoryId: 'vet_medicine',
      rating: 4.6,
      reviews: 45,
    ),
    const ProductModel(
      id: 'p8',
      title: 'Fresh Milk Powder 10kg',
      image: AppImages.promoFarm,
      price: 55.00,
      description:
          'Nutritious milk powder supplement for dairy cattle and calves.',
      categoryId: 'milk',
      subCategoryId: 'dairy_products',
      rating: 4.3,
      reviews: 67,
    ),
  ];

  static List<ProductModel> productsForCategory(String categoryId) {
    return products.where((p) => p.categoryId == categoryId).toList();
  }

  static List<ProductModel> productsForSubCategory(String subCategoryId) {
    return products.where((p) => p.subCategoryId == subCategoryId).toList();
  }

  static ProductModel? productById(String id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  static List<ProductModel> searchProducts(String query) {
    if (query.isEmpty) return products;
    final q = query.toLowerCase();
    return products
        .where((p) => p.title.toLowerCase().contains(q))
        .toList();
  }

  static List<ProductModel> get favoriteProducts =>
      products.where((p) => p.isFavorite).toList();

  static void toggleFavorite(String productId) {
    final index = products.indexWhere((p) => p.id == productId);
    if (index != -1) {
      products[index] =
          products[index].copyWith(isFavorite: !products[index].isFavorite);
    }
  }
}
