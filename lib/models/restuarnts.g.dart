// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restuarnts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restuarnt _$RestuarntFromJson(Map<String, dynamic> json) => Restuarnt(
      restuarnt_name: json['restuarnt_name'] as String,
      food_name: json['food_name'] as String,
      cover: json['cover'] as String?,
      profile: json['profile'] as String?,
      qr_code: json['qr_code'] as String?,
      address: json['address'] as String,
      overview: json['overview'] as String,
      menu: (json['menu'] as List<dynamic>).map((e) => e as int).toList(),
      work_time: (json['work_time'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      menu_products: (json['menu_products'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      restuarnt_options: (json['restuarnt_options'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      rating: (json['rating'] as num).toDouble(),
      prix: (json['prix'] as num?)?.toDouble(),
      deliver_time: (json['deliver_time'] as num).toDouble(),
      location: json['location'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$RestuarntToJson(Restuarnt instance) => <String, dynamic>{
      'food_name': instance.food_name,
      'restuarnt_name': instance.restuarnt_name,
      'cover': instance.cover,
      'profile': instance.profile,
      'address': instance.address,
      'overview': instance.overview,
      'qr_code': instance.qr_code,
      'menu': instance.menu,
      'restuarnt_options': instance.restuarnt_options,
      'work_time': instance.work_time,
      'products': instance.products,
      'menu_products': instance.menu_products,
      'rating': instance.rating,
      'prix': instance.prix,
      'deliver_time': instance.deliver_time,
      'location': instance.location,
    };
