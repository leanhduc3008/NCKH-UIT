import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../common/base/base_view_model.dart';
import '../../data/model/device.dart';
import '../../data/model/floor.dart';
import '../../data/model/room.dart';
import '../../data/model/ticket.dart';
import '../../data/provider/auth_provider.dart';
import '../../data/provider/ticket_provider.dart';
import '../../l10n/generated/l10n.dart';
import '../../widgets/dialog/default_dialog.dart';
import '../home/home_page.dart';
import 'widget/content_template.dart';

class AddTicketViewModel extends BaseViewModel<Ticket> {
  final TicketProvider provider = Get.find();
  final AuthProvider authProvider = Get.find();
  final formKey = GlobalKey<FormState>();
  final floorKey = GlobalKey<FormFieldState<Floor>>();
  final roomKey = GlobalKey<FormFieldState<Room>>();
  final deviceKey = GlobalKey<FormFieldState<Device>>();
  final contentEditController = TextEditingController();
  List<Room> rooms = [];
  List<Device> devices = [];
  Floor? floorSelect;
  Room? roomSelect;
  Device? deviceSelect;
  String? content;

  @override
  void onInit() {
    super.onInit();
    addListener(() {
      if (state != null) {
        provider.add(state!);
        HomePage.goToPage(true);
      }
    });
  }

  @override
  Future<Ticket?> initialData() async {
    return null;
  }

  void onChangedFloor(Floor? value) {
    if (floorSelect != value) {
      floorSelect = value;
      floorKey.currentState!.validate();
      // Reset room
      roomKey.currentState!.reset();
      rooms = Room.datas.where((item) => item.floorId == value?.id).toList();
      onChangedRoom(null);
    }
  }

  void onChangedRoom(Room? value) {
    if (roomSelect != value) {
      roomSelect = value;
      roomKey.currentState!.validate();
      // Reset device
      deviceKey.currentState!.reset();
      devices = Device.datas.where((item) => item.roomId == value?.id).toList();
      onChangedDevice(null);
    }
  }

  void onChangedDevice(Device? value) {
    if (deviceSelect != value) {
      deviceSelect = value;
      deviceKey.currentState!.validate();
    }
  }

  String? validatorFloor(Floor? value) {
    if (value == null) {
      final L10n l10n = L10n.current;
      return l10n.please_select(l10n.floors_page);
    }
    return null;
  }

  String? validatorRoom(Room? value) {
    if (value == null) {
      final L10n l10n = L10n.current;
      return l10n.please_select(l10n.room);
    }
    return null;
  }

  String? validatorDevice(Device? value) {
    if (value == null) {
      final L10n l10n = L10n.current;
      return l10n.please_select(l10n.device);
    }
    return null;
  }

  String? validatorContent(String? value) {
    if (value?.isEmpty ?? true) {
      final L10n l10n = L10n.current;
      return l10n.please_select(l10n.content);
    }
    return null;
  }

  void onSubmit() {
    floorKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      final L10n l10n = L10n.current;

      Get.dialog(DefaultDialog.warning(
        title: Text('${l10n.do_you_want_save_change_request_ticket}?'),
        onAgree: () async {
          onRefresh(_sendMail());
          Get.back();
        },
      ));
    }
  }

  Future<Ticket?> _sendMail() {
    /// Send mail here
    return Future.delayed(
      const Duration(seconds: 1),
      () => Ticket(
        id: deviceSelect!.id,
        user: authProvider.user!,
        floor: floorSelect!,
        room: roomSelect!,
        device: deviceSelect!,
        content: content!,
      ),
    );
  }

  Future<void> selectContentTemplate() async {
    final result = await Get.dialog(const ContentTemplate());
    if (result is String) {
      contentEditController.text = result;
      content = result;
    }
  }
}
