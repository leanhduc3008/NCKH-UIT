import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class Post with _$Post {
  @JsonSerializable(explicitToJson: true)
  const factory Post({
    @Default('') String postId,
    @Default('') String userName,
    @Default('') String imagePost,
    @Default('') String postDate,
    @Default('') String location,
  }) = _Post;
  // From JSON
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  // To JSON
  const Post._();
}
