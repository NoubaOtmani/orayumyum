// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orders.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      productName: json['productName'] as String,
      prix: json['prix'] as int?,
      status: json['status'] as int,
      items: json['items'] as int?,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'productName': instance.productName,
      'prix': instance.prix,
      'status': instance.status,
      'items': instance.items,
    };
