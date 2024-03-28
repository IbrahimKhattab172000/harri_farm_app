import 'package:harri_farm_app/core/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class ForgetPasswordRepository {
  static Future sendCode({required String body}) async {
    return await Network().request(
      Endpoints.FORGETPASSWORD,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
