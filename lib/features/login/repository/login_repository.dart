import 'package:harri_farm_app/core/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class LoginRepository {
  static Future login({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.LOGIN,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
