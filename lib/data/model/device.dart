import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
class Device with _$Device {
  const factory Device({
    required int id,
    @Default(0) int roomId,
    @Default('') String name,
    @Default('') String code,
  }) = _Device;
  // From JSON
  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  // To JSON
  const Device._();

  // Fake data
  static const List<Device> datas = [
    Device(id: 0, roomId: 0, name: 'Device 0 0'),
    Device(id: 1, roomId: 0, name: 'Device 1 0'),
    Device(id: 2, roomId: 1, name: 'Device 2 1'),
    Device(id: 3, roomId: 2, name: 'Device 3 2'),
    Device(id: 4, roomId: 2, name: 'Device 4 2'),
    Device(id: 5, roomId: 3, name: 'Device 5 3'),
    Device(id: 6, roomId: 3, name: 'Device 6 3'),
    Device(id: 7, roomId: 4, name: 'Device 7 4'),
    Device(id: 8, roomId: 4, name: 'Device 8 4'),
  ];
}
