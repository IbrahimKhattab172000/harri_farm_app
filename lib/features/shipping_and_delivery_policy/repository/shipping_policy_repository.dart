import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class ShippingPolicyRepository {
  static Future getShippingPolicy() async {
    return await Network().request(
      Endpoints.SHIPPING_POLICY,
      method: ServerMethods.GET,
    );
  }
}
