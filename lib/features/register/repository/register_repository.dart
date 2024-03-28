import 'package:harri_farm_app/core/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class SignupRepository {
  static Future signUp({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.REGISTER,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
