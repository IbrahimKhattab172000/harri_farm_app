import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class VerificationRepository {
  static Future verifyCode({required Map<String, dynamic> body}) async {
    return Network().request(
      Endpoints.VERIFYCODE,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
