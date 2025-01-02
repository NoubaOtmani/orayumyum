// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      name: json['name'] as String,
      id: json['id'] as int,
      icon: json['icon'] as String?,
      isSelected: json['isSelected'] as bool?,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'icon': instance.icon,
      'isSelected': instance.isSelected,
    };
