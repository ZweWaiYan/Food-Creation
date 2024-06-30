// ignore_for_file: file_names

class randomMealModal {
  final String idMeal;
  final String strMeal;
  final String strMealThumb;
  final String strCategory;

  const randomMealModal({
    required this.idMeal,
    required this.strMeal,
    required this.strMealThumb,
    required this.strCategory,
  });

  factory randomMealModal.fromJson(Map<String, dynamic> json) {
    return randomMealModal(
        idMeal: json['idMeal'] as String,
        strMeal: json['strMeal'] as String,
        strMealThumb: json['strMealThumb'] as String,
        strCategory: json['strCategory'] as String);
  }
}
