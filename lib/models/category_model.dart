class CategoryModel {
  final String id;
  final String name;
  final String icon;
  final String color;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      name: json['name'],
      icon: json['icon'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "icon": icon, "color": color};
  }
}
