// ignore_for_file: file_names

class IngredientList {
  final String idIngredient;
  final String strIngredient;
  final String strDescription;
  final String strType;

  const IngredientList({
    required this.idIngredient,
    required this.strIngredient,
    required this.strDescription,
    required this.strType,
  });

  factory IngredientList.fromJson(Map<String, dynamic> json) {
    return IngredientList(
      idIngredient: json['idIngredient'] as String? ?? '',
      strIngredient: json['strIngredient'] as String? ?? '',
      strDescription: json['strDescription'] as String? ?? '',
      strType: json['strType'] as String? ?? '',
    );
  }
}
