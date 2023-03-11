import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../common/constants/theme.dart';
import '../../common/extension/extenstion.dart';
import '../../router/route_menu.dart';
import '../../widgets/appbar/app_navbar.dart';
import '../../widgets/cell/table_cell.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const String routePath = '/SettingsPage';
  static Future<void>? goToPage() {
    return Get.toNamed(SettingsPage.routePath);
  }

  @override
  State<SettingsPage> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  late bool switchValueOne;
  late bool switchValueTwo;

  @override
  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: RouteMenu.drawer,
        appBar: AppNavbar(title: context.l10n.settings_page),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
            child: Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Recommended Settings',
                        style: TextStyle(
                            color: AppColors.text,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('These are the most important settings',
                        style: TextStyle(color: AppColors.time, fontSize: 14)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Use FaceID to signin',
                        style: TextStyle(color: AppColors.text)),
                    Switch.adaptive(
                      value: switchValueOne,
                      onChanged: (bool newValue) =>
                          setState(() => switchValueOne = newValue),
                      activeColor: AppColors.primary,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Auto-Lock security',
                        style: TextStyle(color: AppColors.text)),
                    Switch.adaptive(
                      value: switchValueTwo,
                      onChanged: (bool newValue) =>
                          setState(() => switchValueTwo = newValue),
                      activeColor: AppColors.primary,
                    )
                  ],
                ),
                TableCellSettings(
                    title: 'Notifications',
                    onTap: () {
                      Navigator.pushNamed(context, '/pro');
                    }),
                const SizedBox(height: 36.0),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text('Payment Settings',
                        style: TextStyle(
                            color: AppColors.text,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('These are also important settings',
                        style: TextStyle(color: AppColors.time)),
                  ),
                ),
                const TableCellSettings(title: 'Manage Payment Options'),
                const TableCellSettings(title: 'Manage Gift Cards'),
                const SizedBox(
                  height: 36.0,
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text('Privacy Settings',
                        style: TextStyle(
                            color: AppColors.text,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Third most important settings',
                        style: TextStyle(color: AppColors.time)),
                  ),
                ),
                TableCellSettings(
                    title: 'User Agreement',
                    onTap: () {
                      Navigator.pushNamed(context, '/pro');
                    }),
                TableCellSettings(
                    title: 'Privacy',
                    onTap: () {
                      Navigator.pushNamed(context, '/pro');
                    }),
                TableCellSettings(
                    title: 'About',
                    onTap: () {
                      Navigator.pushNamed(context, '/pro');
                    }),
              ],
            ),
          ),
        ));
  }
}
