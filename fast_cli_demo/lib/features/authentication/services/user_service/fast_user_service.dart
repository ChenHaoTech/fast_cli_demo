import 'package:flutter/widgets.dart';
import 'package:fast_cli_demo/features/authentication/models/fast_user.dart';

abstract class FastUserService {
  ValueNotifier<FastUser?> user = ValueNotifier(null);

  void setUser(FastUser val) {
    user.value = val;
  }

  Future<void> createUser();

  Future<FastUser?> getUser();

  Future<void> updateUser(FastUser user);

  Future<void> deleteUser(FastUser user);

  Future<void> updateLastLogin();
}
