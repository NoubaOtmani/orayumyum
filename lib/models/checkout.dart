import 'package:json_annotation/json_annotation.dart';
part 'checkout.g.dart';

@JsonSerializable()
class Checkout {
  final List<Map<String, dynamic>>? items;
  final double rating;
  final double sub_total;
  final double total_price;
  final double delivery_fee;
  final int delivery_time;
  final String address;
  final Map<String, dynamic> location;
  Checkout(
      {
      required this.items,
      required this.rating,
      required this.total_price,
      required this.sub_total,
      required this.delivery_fee,
      required this.delivery_time,
      required this.location,
      required this.address});

  factory Checkout.fomJson(Map<String, dynamic> json) => _$CheckoutFromJson(json);

  Map<String, dynamic> toJson(Checkout checkout) => _$CheckoutToJson(this);
}
