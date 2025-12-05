class CategoryResponseEntity {
  final List<CategoryEntity> categories;
  final int count;

  const CategoryResponseEntity({required this.categories, required this.count});
}

class CategoryEntity {
  final String category;
  final int count;

  const CategoryEntity({required this.category, required this.count});
}
