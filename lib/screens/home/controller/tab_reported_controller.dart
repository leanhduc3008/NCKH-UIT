import 'package:get/get.dart';

import '../../../common/base/base_view_model.dart';
import '../../../data/model/ticket.dart';
import '../../../data/provider/ticket_provider.dart';

class TabReportedController extends BaseViewModel<List<Ticket>> {
  final TicketProvider provider = Get.find();

  @override
  Future<List<Ticket>?> initialData() async => provider.getAll();

  void filter() {}
}
