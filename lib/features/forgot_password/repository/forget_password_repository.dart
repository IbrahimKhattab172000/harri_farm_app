import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class ForgetPasswordRepository {
  static Future sendCode({required String body}) async {
    return await Network().request(
      Endpoints.FORGET_PASSWORD,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
