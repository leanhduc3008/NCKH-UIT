import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/dimens.dart';
import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../widgets/widget.dart';

class FloorPage extends StatefulWidget {
  const FloorPage({super.key});

  static const String routePath = '/FloorPage';
  static Future<void>? goToPage([int num = 0]) {
    return Get.toNamed(
      FloorPage.routePath,
      arguments: num,
      preventDuplicates: false,
    );
  }

  @override
  State<FloorPage> createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppNavbar(
        title: '${context.l10n.floors_page} ${Get.arguments}',
      ),
      body: Row(
        children: [
          if (context.isLandscape) ...[
            NavigationRail(
              labelType: context.responsiveValue<NavigationRailLabelType>(
                desktop: NavigationRailLabelType.all,
                tablet: NavigationRailLabelType.all,
                mobile: NavigationRailLabelType.selected,
                watch: NavigationRailLabelType.none,
              ),
              onDestinationSelected: controller.animateTo,
              selectedIndex: controller.index,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const Icon(Icons.room),
                  label: Text(context.l10n.room),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.light),
                  label: Text(context.l10n.device),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
          ],
          Expanded(
            child: TabBarView(
              controller: controller,
              children: const [
                TabRoom(),
                TabDevice(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: context.isPortrait
          ? BottomNavigationBar(
              currentIndex: controller.index,
              onTap: controller.animateTo,
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.room),
                  label: context.l10n.room,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.light),
                  label: context.l10n.device,
                ),
              ],
            )
          : null,
    );
  }
}

class TabRoom extends StatelessWidget {
  const TabRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(Dimens.s3),
      itemBuilder: _buildItem,
      itemCount: 20,
      separatorBuilder: (_, __) => const SizedBox(height: Dimens.s3),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return BaseCard(
      leading: const Icon(Icons.light),
      content:
          Text('Thông tin phòng $index', style: context.textStyle.bodySmall),
    );
  }
}

class TabDevice extends StatelessWidget {
  const TabDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(Dimens.s2),
          child: AppOutlinedIconButton(
            height: Dimens.s7,
            expandedWith: false,
            onPressed: () {},
            icon: const Icon(Icons.filter_list, size: Dimens.s4),
            label: Text(context.l10n.room),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(Dimens.s3),
            itemBuilder: _buildItem,
            itemCount: 20,
            separatorBuilder: (_, __) => const SizedBox(height: Dimens.s3),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return BaseCard.image(
      imageUrl: '',
      leading: Text('Thiết bị $index', style: context.textStyle.titleSmall),
      content:
          Text('Thông tin thiết bị $index', style: context.textStyle.bodySmall),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.s2),
        decoration: BoxDecoration(
          color: AppColors.success,
          borderRadius: Dimens.s3.borderRadius,
        ),
        child: Text('Variable',
            style: context.textStyle.labelSmall
                ?.copyWith(color: context.colorScheme.onPrimary)),
      ),
    );
  }
}
