import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality.freezed.dart';
part 'air_quality.g.dart';

@freezed
class AirQuality with _$AirQuality {
  @JsonSerializable(explicitToJson: true)
  const factory AirQuality({
    @Default(0) int AQI,
    @Default(0) int pm2_5,
    @Default(0) int pm10,
    @Default(0) int o3,
    @Default(0) int so2,
    @Default(0) int no2,
    @Default(0) int co,
  }) = _AirQuality;
  // From JSON
  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);

  // To JSON
  const AirQuality._();
}
