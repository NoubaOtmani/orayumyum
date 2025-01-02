// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feeds _$FeedsFromJson(Map<String, dynamic> json) => Feeds(
      videoUrl: json['videoUrl'] as String,
      id: json['id'] as String,
      desc: json['desc'] as String?,
      restuarnt_name: json['restuarnt_name'] as String,
      profile_url: json['profile_url'] as String,
      isLiked: json['isLiked'] as bool?,
    );

Map<String, dynamic> _$FeedsToJson(Feeds instance) => <String, dynamic>{
      'videoUrl': instance.videoUrl,
      'id': instance.id,
      'desc': instance.desc,
      'restuarnt_name': instance.restuarnt_name,
      'profile_url': instance.profile_url,
      'isLiked': instance.isLiked,
    };
