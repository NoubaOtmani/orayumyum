import 'package:json_annotation/json_annotation.dart';
import 'package:orayemem/models/comments.dart';
part 'reviews.g.dart';

@JsonSerializable()
class Reviews {
  final double rating;
  final int reviews;
  final List<Map<String, dynamic>> ratings;

  Reviews({
 
    required this.reviews,
    required this.ratings,
    required this.rating,
  });

  factory Reviews.fomJson(Map<String, dynamic> json) => _$ReviewsFromJson(json);

  Map<String, dynamic> toJson(Reviews reviews) => _$ReviewsToJson(this);
}
