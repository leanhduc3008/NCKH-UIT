import 'package:get/instance_manager.dart';

import '../../../data/model/user.dart';
import '../../../data/network/api_service.dart';

class AuthRepository {
  AuthRepository();

  static String path = '/api/v1/users';

  final ApiInterface _apiService = Get.find<ApiService>();

  Future<User> sendLoginData({
    required String username,
    required String password,
  }) =>
      _apiService.postJson(
        endpoint: '$path/auth/login',
        data: <String, dynamic>{
          'username': username,
          'password': password,
        },
        requiresAuthToken: false,
        converter: (data) => User.fromJson(data),
      );
}
