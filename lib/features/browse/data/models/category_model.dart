import 'package:waster/features/browse/domain/entity/category_entity.dart';

class CategoryResponseModel extends CategoryResponseEntity {
  const CategoryResponseModel({
    required super.categories,
    required super.count,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      categories: (json['categories'] as List)
          .map((item) => CategoryModel.fromJson(item))
          .toList(),
      count: json['count'],
    );
  }
}

class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.category, required super.count});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(category: json['category'], count: json['count']);
  }
}
