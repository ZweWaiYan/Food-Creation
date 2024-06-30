// ignore_for_file: file_names

class AreaList {
  final String strArea;

  const AreaList({
    required this.strArea,
  });

  factory AreaList.fromJson(Map<String, dynamic> json) {
    return AreaList(strArea: json['strArea'] as String);
  }
}
