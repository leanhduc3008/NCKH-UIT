import 'package:freezed_annotation/freezed_annotation.dart';

part 'floor.freezed.dart';
part 'floor.g.dart';

@freezed
class Floor with _$Floor {
  const factory Floor({
    required int id,
    @Default(0) double position,
    @Default('') String name,
  }) = _Floor;
  // From JSON
  factory Floor.fromJson(Map<String, dynamic> json) => _$FloorFromJson(json);

  // To JSON
  const Floor._();

  // Fake data
  static const List<Floor> datas = [
    Floor(id: 0, position: 1, name: 'Floor 1'),
    Floor(id: 1, position: 2, name: 'Floor 2'),
    Floor(id: 2, position: 3, name: 'Floor 3'),
    Floor(id: 3, position: 4, name: 'Floor 4'),
    Floor(id: 4, position: 5, name: 'Floor 5'),
  ];
}
