// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reviews _$ReviewsFromJson(Map<String, dynamic> json) => Reviews(
      reviews: json['reviews'] as int,
      ratings: (json['ratings'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$ReviewsToJson(Reviews instance) => <String, dynamic>{
      'rating': instance.rating,
      'reviews': instance.reviews,
      'ratings': instance.ratings,
    };
