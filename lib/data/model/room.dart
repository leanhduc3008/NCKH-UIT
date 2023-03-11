import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
class Room with _$Room {
  const factory Room({
    required int id,
    @Default(0) int floorId,
    @Default('') String name,
  }) = _Room;
  // From JSON
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  // To JSON
  const Room._();

  // Fake data
  static const List<Room> datas = [
    Room(id: 0, floorId: 0, name: 'Room 1.1'),
    Room(id: 1, floorId: 0, name: 'Room 1.2'),
    Room(id: 2, floorId: 1, name: 'Room 2.0'),
    Room(id: 3, floorId: 2, name: 'Room 3.1'),
    Room(id: 4, floorId: 2, name: 'Room 3.2'),
    Room(id: 5, floorId: 3, name: 'Room 4.1'),
    Room(id: 6, floorId: 3, name: 'Room 4.2'),
    Room(id: 7, floorId: 4, name: 'Room 5.1'),
    Room(id: 8, floorId: 4, name: 'Room 3.2'),
  ];
}
