import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../database/no_sql_storage.dart';
import '../model/user.dart';

abstract class AuthProvider {
  Future<User> login(String username, String password);
  Future<void> logout();
  Future<String?> token();
  Future<String?> saveToken(String token);

  User? get user;
  set user(User? value);
  Future<void> updateUser(User value);
}

enum _AuthKey {
  user,
  token,
}

class AuthProviderImpl extends GetxService implements AuthProvider {
  AuthProviderImpl() : super();

  final NoSqlStorage _storage = Get.find<NoSqlStorage>();

  @override
  Future<User> login(String username, String password) async {
    final User user = User(
      id: 0,
      username: username,
      fullName: username,
    );

    await updateUser(user);

    return user;
  }

  @override
  Future<void> logout() async {
    _storage.clearEncrypted();
    _storage.clear();
  }

  @override
  Future<String?> token() => _storage.getEncrypted(_AuthKey.token.toString());

  @override
  User? get user {
    try {
      final json = _storage.getItem(_AuthKey.user.toString());
      return User.fromJson(json!);
    } catch (_) {
      return null;
    }
  }

  @override
  set user(User? value) {
    if (value == null) {
      return;
    }
    _storage.saveItem(_AuthKey.user.toString(), value.toJson());
  }

  @override
  Future<void> updateUser(User value) async {
    await _storage.saveItem(
      _AuthKey.user.toString(),
      (user ?? value)
          .copyWith(
            id: value.id,
            username: value.username,
            fullName: value.fullName,
            isAdmin: value.isAdmin,
          )
          .toJson(),
    );
  }

  @override
  Future<String?> saveToken(String token) async {
    return await _storage.saveEncrypted(_AuthKey.token.toString(), token)
        ? token
        : null;
  }
}
