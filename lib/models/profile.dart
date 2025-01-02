import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  final String firstName;
  final double lastName;
  final double birthDay;
  final int gender;
  final String email;
  final String phoneNumber;

  Profile(
      {required this.firstName,
      required this.lastName,
      required this.birthDay,
      required this.gender,
      required this.email,
      required this.phoneNumber});

  factory Profile.fomJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson(Profile profile) => _$ProfileToJson(this);
}
