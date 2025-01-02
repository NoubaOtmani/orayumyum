import 'package:json_annotation/json_annotation.dart';
import 'package:orayemem/models/comments.dart';
part 'orders.g.dart';

@JsonSerializable()
class Orders {
  final String productName;
  final int? prix;
  final int status;
  final int? items;
  Orders({
    required this.productName,
    required this.prix,
    required this.status,
    required this.items,
  });

  factory Orders.fomJson(Map<String, dynamic> json) => _$OrdersFromJson(json);

  Map<String, dynamic> toJson(Orders order) => _$OrdersToJson(this);
}
