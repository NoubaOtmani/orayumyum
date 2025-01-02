import 'package:json_annotation/json_annotation.dart';
part 'products.g.dart';

@JsonSerializable()
class Proudcts {
  final String food_name;
  final String restuarnt_name;
  final String image;
  final String? profile;
  final String desc;
  final List<Map<String, dynamic>>? ingredients;
  final double rating;
  final double prix;
  final double deliver_time;
  Proudcts({
    required this.food_name,
    required this.restuarnt_name,
    required this.image,
    this.profile,
    required this.desc,
    this.ingredients,
    required this.rating,
    required this.prix,
    required this.deliver_time,
  });

  factory Proudcts.fomJson(Map<String, dynamic> json) =>
      _$ProudctsFromJson(json);

  Map<String, dynamic> toJson() => _$ProudctsToJson(this);
}
