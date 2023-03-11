import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/base/base_page_reponse.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    @Default('') String username,
    @Default('') String fullName,
    @Default(false) bool isAdmin,
  }) = _User;
  // From JSON
  factory User.fromJson(Json json) => _$UserFromJson(json);

  // To JSON
  const User._();
}
