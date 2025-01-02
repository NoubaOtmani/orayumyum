import 'package:json_annotation/json_annotation.dart';
part 'restuarnts.g.dart';

@JsonSerializable()
class Restuarnt {
  final String food_name;
  final String restuarnt_name;
  final String? cover;
  final String? profile;
  final String address;
  final String overview;
  final String? qr_code;
  final List<int> menu;
  final List<int> restuarnt_options;
  final List<Map<String, dynamic>>? work_time;
  final List<Map<String, dynamic>>? products;
  final List<Map<String, dynamic>>? menu_products;
  final double rating;
  final double? prix;
  final double deliver_time;
  final Map<String, dynamic> location;

  Restuarnt({
    required this.restuarnt_name,
    required this.food_name,
    this.cover,
    this.profile,
    this.qr_code,
    required this.address,
    required this.overview,
    required this.menu,
    this.work_time,
    this.products,
    this.menu_products,
    required this.restuarnt_options,
    required this.rating,
    this.prix,
    required this.deliver_time,
    required this.location,
  });

  factory Restuarnt.fomJson(Map<String, dynamic> json) =>
      _$RestuarntFromJson(json);

  Map<String, dynamic> toJson(Restuarnt restuarnt) => _$RestuarntToJson(this);
}
