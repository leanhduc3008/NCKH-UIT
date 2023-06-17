import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';

import '../common/constants/dimens.dart';
import '../common/extension/extenstion.dart';
import '../data/provider/auth_provider.dart';
import '../l10n/generated/l10n.dart';
import '../screens/air_quality/screen/air_quality_screen.dart';
import '../screens/authentication/login/login_page.dart';
import '../screens/home/home_page.dart';
import '../screens/profile/profile_page.dart';
import '../screens/settings/settings_page.dart';
import '../screens/weather/weather_page.dart';
import '../widgets/widget.dart';

class RouteMenu {
  const RouteMenu._();

  static final AppDrawer drawer = AppDrawer(
    items: menu,
    footer: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: Dimens.s2),
        Builder(builder: (context) {
          return AppElevatedIconButton(
            backgroundColor: context.colorScheme.error,
            borderRadius: Dimens.s3.borderRadius,
            icon: const Icon(FontAwesomeIcons.rightFromBracket),
            label: Text(L10n.current.logout),
            onPressed: () {
              Get.find<AuthProvider>().logout();
              LoginPage.goToPage();
            },
          );
        }),
        const SizedBox(height: Dimens.s1),
      ],
    ),
  );

  static final List<AppDrawerItem> menu = [
    AppDrawerItem(
      icon: FontAwesomeIcons.house,
      label: L10n.current.home_page,
      routePath: HomePage.routePath,
      onTap: HomePage.goToPage,
    ),
    const AppDrawerItem(
      icon: Icons.sunny,
      label: 'Dự báo thời tiết',
      routePath: WeatherPage.routePath,
      onTap: WeatherPage.goToPage,
    ),
    const AppDrawerItem(
      icon: FontAwesomeIcons.wind,
      label: 'Chất lượng không khí',
      routePath: AirQualityPage.routePath,
      onTap: AirQualityPage.goToPage,
    ),
    AppDrawerItem(
      icon: FontAwesomeIcons.user,
      label: L10n.current.profile_page,
      routePath: ProfilePage.routePath,
      onTap: ProfilePage.goToPage,
    ),
    AppDrawerItem(
      icon: FontAwesomeIcons.gear,
      label: L10n.current.settings_page,
      routePath: SettingsPage.routePath,
      onTap: SettingsPage.goToPage,
    ),
  ];
}
