// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Proudcts _$ProudctsFromJson(Map<String, dynamic> json) => Proudcts(
      food_name: json['food_name'] as String,
      restuarnt_name: json['restuarnt_name'] as String,
      image: json['image'] as String,
      profile: json['profile'] as String?,
      desc: json['desc'] as String,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      rating: (json['rating'] as num).toDouble(),
      prix: (json['prix'] as num).toDouble(),
      deliver_time: (json['deliver_time'] as num).toDouble(),
    );

Map<String, dynamic> _$ProudctsToJson(Proudcts instance) => <String, dynamic>{
      'food_name': instance.food_name,
      'restuarnt_name': instance.restuarnt_name,
      'image': instance.image,
      'profile': instance.profile,
      'desc': instance.desc,
      'ingredients': instance.ingredients,
      'rating': instance.rating,
      'prix': instance.prix,
      'deliver_time': instance.deliver_time,
    };
