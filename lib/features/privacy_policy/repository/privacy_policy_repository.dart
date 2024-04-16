import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class PrivacyPolicyRepository {
  static Future getPrivacyPolicy() async {
    return await Network().request(
      Endpoints.PRIVACY_POLICY,
      method: ServerMethods.GET,
    );
  }
}
