import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination.freezed.dart';
part 'destination.g.dart';

@freezed
class Destination with _$Destination {
  @JsonSerializable(explicitToJson: true)
  const factory Destination({
    @Default('') String name,
    @Default('') String imageUrl,
    @Default('') String location,
    @Default('') String detail,
  }) = _Destination;
  // From JSON
  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  // To JSON
  const Destination._();
}
