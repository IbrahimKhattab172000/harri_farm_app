import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class ResetPasswordRepository {
  static Future resetPassword({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.RESET_PASSWORD,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
