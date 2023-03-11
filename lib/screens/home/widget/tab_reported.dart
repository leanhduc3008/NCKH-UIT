import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/state_manager.dart';

import '../../../common/constants/dimens.dart';
import '../../../common/extension/extenstion.dart';
import '../../../data/model/ticket.dart';
import '../../../widgets/widget.dart';
import '../../add_ticket/add_ticket_page.dart';
import '../controller/tab_reported_controller.dart';

class TabReported extends GetView<TabReportedController> {
  const TabReported({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.builder((state) {
        if (state?.isEmpty ?? true) {
          return Center(child: Text(context.l10n.no_data));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(Dimens.s2),
              child: AppOutlinedIconButton(
                height: Dimens.s7,
                expandedWith: false,
                onPressed: controller.filter,
                icon: const Icon(Icons.filter_list, size: Dimens.s4),
                label: Text(context.l10n.filter),
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(Dimens.s2),
                itemBuilder: (_, index) => ItemTicket(controller.state![index]),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: Dimens.s2),
                itemCount: controller.state!.length,
              ),
            ),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.colorScheme.tertiaryContainer,
        onPressed: AddTicketPage.goToPage,
        child: Icon(
          FontAwesomeIcons.plus,
          color: context.colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }
}

class ItemTicket extends StatelessWidget {
  const ItemTicket(this.item, {super.key});

  final Ticket item;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      leading: const Icon(FontAwesomeIcons.ticket),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ID ${item.id}: <${item.floor.name}><${item.room.name}>',
              style: context.textStyle.titleSmall),
          Text(
            '${item.device.name}\n${item.content}',
            style: context.textStyle.labelMedium,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
