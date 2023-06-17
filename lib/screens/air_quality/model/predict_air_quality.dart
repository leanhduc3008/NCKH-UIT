import 'package:freezed_annotation/freezed_annotation.dart';

part 'predict_air_quality.freezed.dart';
part 'predict_air_quality.g.dart';

@freezed
class PredictAirQuality with _$PredictAirQuality {
  @JsonSerializable(explicitToJson: true)
  const factory PredictAirQuality({
    @Default(0) int AQI,
    @Default('') String Date,
    @Default('') String algorithm,
  }) = _PredictAirQuality;
  // From JSON
  factory PredictAirQuality.fromJson(Map<String, dynamic> json) =>
      _$PredictAirQualityFromJson(json);

  // To JSON
  const PredictAirQuality._();
}
