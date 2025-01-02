

import 'package:json_annotation/json_annotation.dart';
import 'package:orayemem/models/restuarnts.dart';
part 'feeds.g.dart';

@JsonSerializable()
class Feeds {
  final String videoUrl;
  final String id;
  final String? desc;
  final String restuarnt_name;
  final String profile_url;
  final bool? isLiked;
  Feeds({
    required this.videoUrl,
    required this.id,
    required this.desc,
    required this.restuarnt_name,
    required this.profile_url,
    required this.isLiked,
  });

  factory Feeds.fomJson(Map<String, dynamic> json) =>
      _$FeedsFromJson(json);

  Map<String, dynamic> toJson(Feeds feeds) =>
      _$FeedsToJson(this);
}
