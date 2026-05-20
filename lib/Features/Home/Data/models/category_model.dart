import 'package:flutter/material.dart';

class CategoryModel {
  final String id;
  final String title;
  final IconData icon;

  const CategoryModel({
    required this.id,
    required this.title,
    required this.icon,
  });
}

class SubCategoryModel {
  final String id;
  final String title;
  final String image;
  final String categoryId;

  const SubCategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.categoryId,
  });
}

class ProductModel {
  final String id;
  final String title;
  final String image;
  final double price;
  final String description;
  final String categoryId;
  final String? subCategoryId;
  final double rating;
  final int reviews;
  final bool isFavorite;

  const ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.categoryId,
    this.subCategoryId,
    this.rating = 4.5,
    this.reviews = 0,
    this.isFavorite = false,
  });

  ProductModel copyWith({bool? isFavorite}) {
    return ProductModel(
      id: id,
      title: title,
      image: image,
      price: price,
      description: description,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      rating: rating,
      reviews: reviews,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class BannerModel {
  final String image;
  final String? title;

  const BannerModel({
    required this.image,
    this.title,
  });
}
