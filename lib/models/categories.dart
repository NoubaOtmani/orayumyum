import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';

@JsonSerializable()
class Categories {
  final String name;
  final int id;
  final String? icon;
  final bool? isSelected;
  Categories({
    required this.name,
    required this.id,
    required this.icon,
    required this.isSelected,
  });

  factory Categories.fomJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson(Categories categories) =>
      _$CategoriesToJson(this);
}
