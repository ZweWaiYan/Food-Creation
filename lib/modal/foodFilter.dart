// ignore_for_file: file_names

class FoodFilter {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  const FoodFilter({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  factory FoodFilter.fromJson(Map<String, dynamic> json) {
    return FoodFilter(
        idMeal: json['idMeal'] as String,
        strMeal: json['strMeal'] as String,
        strMealThumb: json['strMealThumb'] as String);
  }
}
