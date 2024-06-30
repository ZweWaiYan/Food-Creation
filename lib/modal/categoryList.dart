// ignore_for_file: file_names

class CategoryList {
  final String strCategory;

  const CategoryList({
    required this.strCategory,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(strCategory: json['strCategory'] as String);
  }
}
