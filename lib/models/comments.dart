import 'package:json_annotation/json_annotation.dart';
part 'comments.g.dart';

@JsonSerializable()
class Comments {
  final double rating;
  final String userName;
  final String profile_pic;
  final String comment;
  Comments({
    required this.userName,
    required this.rating,
    required this.comment,
    required this.profile_pic,
  });

  factory Comments.fomJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson(Comments comments) => _$CommentsToJson(this);
}
