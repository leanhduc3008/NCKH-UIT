import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import '../database/no_sql_storage.dart';
import '../model/ticket.dart';

class TicketProvider extends GetxService {
  static const String _storeKey = 'TicketProvider';
  final NoSqlStorage _storage = Get.find<NoSqlStorage>();

  List<Ticket>? getAll() => _getAllLocal();

  Future<void> add(Ticket ticket) => _saveAllLocal([ticket, ...?getAll()]);

  List<Ticket>? _getAllLocal() {
    try {
      final items = _storage.getItems<Map<String, dynamic>>(_storeKey);

      return items?.map(Ticket.fromJson).toList();
    } catch (e) {
      return null;
    }
  }

  Future<void> _saveAllLocal(List<Ticket> items) {
    return _storage.saveItems(_storeKey, items.map((e) => e.toJson()).toList());
  }
}
