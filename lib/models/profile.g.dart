// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      firstName: json['firstName'] as String,
      lastName: (json['lastName'] as num).toDouble(),
      birthDay: (json['birthDay'] as num).toDouble(),
      gender: json['gender'] as int,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthDay': instance.birthDay,
      'gender': instance.gender,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
    };
