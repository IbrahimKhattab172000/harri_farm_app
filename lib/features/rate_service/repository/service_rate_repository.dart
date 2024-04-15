import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class RateServiceRepository {
  static Future sendRate({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.RATE_SERVICE,
      method: ServerMethods.POST,
      body: body,
    );
  }
}
