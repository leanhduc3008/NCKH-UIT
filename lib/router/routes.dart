import 'package:get/get.dart';

import '../screens/air_quality/screen/air_quality_binder.dart';
import '../screens/air_quality/screen/air_quality_screen.dart';
import '../screens/air_quality/screen/select_city/select_city_binder.dart';
import '../screens/air_quality/screen/select_city/select_city_screen.dart';
import '../screens/authentication/login/login_binder.dart';
import '../screens/authentication/login/login_page.dart';
import '../screens/authentication/register/email_verification/email_verification_binder.dart';
import '../screens/authentication/register/email_verification/email_verification_page.dart';
import '../screens/authentication/register/register_binder.dart';
import '../screens/authentication/register/register_page.dart';
import '../screens/authentication/register/register_success/register_success_binder.dart';
import '../screens/authentication/register/register_success/register_success_page.dart';
import '../screens/detail_destination/screen/detail_destination_binder.dart';
import '../screens/detail_destination/screen/detail_destination_page.dart';
import '../screens/detail_destination/screen/google_map/google_map.dart';
import '../screens/detail_destination/screen/google_map/google_map_binder.dart';
import '../screens/home/home_binder.dart';
import '../screens/home/home_page.dart';
import '../screens/list_destination/list_city_and_Province.dart';
import '../screens/list_destination/list_city_and_province_binder.dart';
import '../screens/list_destination/list_destination/list_destination_binder.dart';
import '../screens/list_destination/list_destination/list_destination_page.dart';
import '../screens/other/empty_page.dart';
import '../screens/profile/profile_binder.dart';
import '../screens/profile/profile_page.dart';
import '../screens/profile/update_profile/update_profile_binder.dart';
import '../screens/profile/update_profile/update_profile_page.dart';
import '../screens/settings/settings_page.dart';
import '../screens/template/articles.dart';
import '../screens/template/colors.dart';
import '../screens/template/components.dart';
import '../screens/template/onboarding.dart';
import '../screens/template/pro.dart';
import '../screens/template/register.dart';
import '../screens/template/template_page.dart';
import '../screens/weather/city/city_list_binder.dart';
import '../screens/weather/city/city_lists.dart';
import '../screens/weather/weather_binder.dart';
import '../screens/weather/weather_page.dart';
import 'middleware/auth_middleware.dart';

class Routes {
  const Routes._();

  static String? get initialRoute => LoginPage.routePath;

  static GetPage get unknownRoute => GetPage(
        name: EmptyPage.routePath,
        page: () => const EmptyPage(),
      );

  /// ------------------ Main ----------------------------
  static final List<GetPage> pages = <GetPage>[
    GetPage(
      name: LoginPage.routePath,
      binding: LoginBinder(),
      page: () => const LoginPage(),
      children: _auth,
    ),
    GetPage(
        name: HomePage.routePath,
        middlewares: [AuthMiddleware()],
        binding: HomeBinder(),
        page: () => const HomePage(),
        children: _home),
    GetPage(
        name: WeatherPage.routePath,
        middlewares: [AuthMiddleware()],
        binding: WeatherBinder(),
        page: () => const WeatherPage(),
        children: [
          GetPage(
            name: CityLists.routePath,
            middlewares: [AuthMiddleware()],
            binding: CityListBinder(),
            page: () => const CityLists(),
          )
        ]),
    GetPage(
        name: AirQualityPage.routePath,
        middlewares: [AuthMiddleware()],
        binding: AirQualityBinder(),
        page: () => const AirQualityPage(),
        children: [
          GetPage(
            name: SelectCityScreen.routePath,
            binding: SelectCityBinder(),
            page: () => const SelectCityScreen(),
          )
        ]),
    GetPage(
        name: ProfilePage.routePath,
        middlewares: [AuthMiddleware()],
        binding: ProfileBinder(),
        page: () => const ProfilePage(),
        children: [
          GetPage(
            name: UpdateProfilePage.routePath,
            binding: UpdateProfileBinder(),
            page: () => const UpdateProfilePage(),
          ),
        ]),
    GetPage(
      name: SettingsPage.routePath,
      page: () => const SettingsPage(),
    ),
    GetPage(
      name: TemplatePage.routePath,
      middlewares: [AuthMiddleware()],
      page: () => const TemplatePage(),
      children: _template,
    ),
  ];

  /// ------------------ Authentication ------------------
  static final List<GetPage> _auth = <GetPage>[
    GetPage<RegisterPage>(
        name: RegisterPage.routePath,
        binding: RegisterBinder(),
        page: () => const RegisterPage(),
        children: [
          GetPage<EmailVerificationPage>(
              name: EmailVerificationPage.routePath,
              binding: EmailVerificationBinder(),
              page: () => const EmailVerificationPage(),
              children: [
                GetPage<RegisterSuccessPage>(
                    name: RegisterSuccessPage.routePath,
                    binding: RegisterSuccessBinder(),
                    page: () => const RegisterSuccessPage()),
              ]),
        ]),
  ];

  /// ------------------ Home Page ------------------
  static final List<GetPage> _home = <GetPage>[
    GetPage<DetailDestinationPage>(
        name: DetailDestinationPage.routePath,
        binding: DetailDestinationBinder(),
        page: () => const DetailDestinationPage(),
        children: [
          GetPage<GoogleMapPage>(
            name: GoogleMapPage.routePath,
            binding: GoogleMapBinder(),
            page: () => const GoogleMapPage(),
          ),
        ]),
    GetPage<ListCityAndProvince>(
        name: ListCityAndProvince.routePath,
        binding: ListCityAndProvinceBinder(),
        page: () => const ListCityAndProvince(),
        children: [
          GetPage<ListDestinationPage>(
              name: ListDestinationPage.routePath,
              binding: ListDestinationBinder(),
              page: () => const ListDestinationPage(),
              children: [
                GetPage<DetailDestinationPage>(
                    name: DetailDestinationPage.routePath,
                    binding: DetailDestinationBinder(),
                    page: () => const DetailDestinationPage(),
                    children: [
                      GetPage<GoogleMapPage>(
                        name: GoogleMapPage.routePath,
                        binding: GoogleMapBinder(),
                        page: () => const GoogleMapPage(),
                      ),
                    ])
              ]),
        ]),
  ];

  /// ------------------ Template -----------------------
  static final List<GetPage> _template = <GetPage>[
    GetPage(
      name: Components.routePath,
      page: () => const Components(),
    ),
    GetPage(
      name: ColorPage.routePath,
      page: () => const ColorPage(),
    ),
    GetPage(
      name: Articles.routePath,
      page: () => const Articles(),
    ),
    GetPage(
      name: Onboarding.routePath,
      page: () => const Onboarding(),
    ),
    GetPage(
      name: Pro.routePath,
      page: () => const Pro(),
    ),
    GetPage(
      name: Register.routePath,
      page: () => const Register(),
    ),
  ];
}
