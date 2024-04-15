import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:harri_farm_app/features/splash/view/splash_view.dart';
import 'package:harri_farm_app/features/update_profile/models/update_profile_model.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  ///Token-------------
  static void cacheToken(String value) => _box.write('token', value);
  static bool get isLogged => _box.hasData('token');
  static String? get getToken => _box.read('token');

//-----------------------
// //registerToken
//   static void registerToken(String value) => _box.write('registerToken', value);
//   static String? get getRegisterToken => _box.read('registerToken');

  // ///Token-------------
  // static void cacheRegisterCode(var value) => _box.write('code', value);
  // static bool get isRegistered => _box.hasData('code');

//-----------------------

//verificationToken-----------
  static void cacheVerification(var value) => _box.write('verification', value);
  static bool get isVerification => _box.hasData('verification');
  static int? get getVerification => _box.read('verification');
//-------------

//verificationToken-----------
  static void cacheOnBoarding(bool value) =>
      _box.write('onboarding_completed', value);
  static bool get isOnBoardingComplete =>
      _box.read('onboarding_completed') ?? false;

//--------------
  static void cacheSocial(String value) => _box.write('social', value);

  static void cacheNotification(bool value) =>
      _box.write('notification', value);

//--------
  static void cacheId(var id) => _box.write('id', id);
//----
  static Future<void> cacheUser(UpdateProfileModel user) async =>
      await _box.write('user', user.toJson());
  static UpdateProfileModel get getUserModel =>
      UpdateProfileModel.fromJson(_box.read('user'));
  // static Future<void> cacheUser(UserModel user) async => await _box.write('user', user.toJson());
  // static UserModel get getUserModel => UserModel.fromJson(_box.read('user'));
  // static int get getId => getUserModel.data!.id!;

  static int get getUserId => _box.read('id');

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
