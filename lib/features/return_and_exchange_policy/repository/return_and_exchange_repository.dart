import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class ReturnAndExchangeRepository {
  static Future getExchangePolicy() async {
    return await Network().request(
      Endpoints.EXCHANGE_POLICY,
      method: ServerMethods.GET,
    );
  }
}
