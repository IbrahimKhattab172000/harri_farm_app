import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:harri_farm_app/features/splash/view/view.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static void cacheToken(String value) => _box.write('token', value);

  static void cacheSocial(String value) => _box.write('social', value);

  static void cacheNotification(bool value) =>
      _box.write('notification', value);

  static void cacheId(int id) => _box.write('id', id);

  // static Future<void> cacheUser(UserModel user) async => await _box.write('user', user.toJson());
  // static UserModel get getUserModel => UserModel.fromJson(_box.read('user'));
  // static int get getId => getUserModel.data!.id!;

  static String get getToken => _box.read('token') ?? "";

  static bool get isLogged => _box.hasData('userToken');

  static bool? get getNotification => _box.read('notification');

  static String? get currency => _box.read('currency');

  static void removeCache() {
    _box.erase();
  }

  static Future signOut() async {
    await _box.erase();
    log("user isLogged :: $isLogged");
    // CustomNavigator.push(Routes.SPLASH, clean: true);
    RouteUtils.navigateAndReplace(const SplashView());
  }
}

class UserTokenModel {
  String token;

  UserTokenModel(this.token);

  factory UserTokenModel.fromJson(Map<String, dynamic> json) {
    return UserTokenModel(json['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
