// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checkout _$CheckoutFromJson(Map<String, dynamic> json) => Checkout(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      rating: (json['rating'] as num).toDouble(),
      total_price: (json['total_price'] as num).toDouble(),
      sub_total: (json['sub_total'] as num).toDouble(),
      delivery_fee: (json['delivery_fee'] as num).toDouble(),
      delivery_time: json['delivery_time'] as int,
      location: json['location'] as Map<String, dynamic>,
      address: json['address'] as String,
    );

Map<String, dynamic> _$CheckoutToJson(Checkout instance) => <String, dynamic>{
      'items': instance.items,
      'rating': instance.rating,
      'sub_total': instance.sub_total,
      'total_price': instance.total_price,
      'delivery_fee': instance.delivery_fee,
      'delivery_time': instance.delivery_time,
      'address': instance.address,
      'location': instance.location,
    };
