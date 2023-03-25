import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true)
  const factory UserModel({
    @Default('') String id,
    @Default('') String phoneNumber,
    @Default('') String fullName,
    @Default(0) int age,
    @Default('') String email,
  }) = _UserModel;
  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // To JSON
  const UserModel._();
}
