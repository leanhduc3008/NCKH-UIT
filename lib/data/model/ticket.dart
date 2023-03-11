import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common/base/base_page_reponse.dart';
import 'device.dart';
import 'floor.dart';
import 'room.dart';
import 'user.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required int id,
    required User user,
    required Floor floor,
    required Room room,
    required Device device,
    @Default('') String content,
  }) = _Ticket;
  // From JSON
  factory Ticket.fromJson(Json json) => _$TicketFromJson(json);

  // To JSON
  const Ticket._();
}
