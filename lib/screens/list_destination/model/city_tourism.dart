import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_tourism.freezed.dart';
part 'city_tourism.g.dart';

@freezed
class CityTourism with _$CityTourism {
  @JsonSerializable(explicitToJson: true)
  const factory CityTourism({
    @Default('') String cityName,
    @Default('') String image,
    @Default('') String weather,
  }) = _CityTourism;
  // From JSON
  factory CityTourism.fromJson(Map<String, dynamic> json) =>
      _$CityTourismFromJson(json);

  // To JSON
  const CityTourism._();
}
