// ignore_for_file: file_names

class MealList {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  const MealList({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
  });

  factory MealList.fromJson(Map<String, dynamic> json) {
    return MealList(
      idMeal: json['idMeal'] as String,
      strMeal: json['strMeal'] as String,
      strMealThumb: json['strMealThumb'] as String,
    );
  }
}
