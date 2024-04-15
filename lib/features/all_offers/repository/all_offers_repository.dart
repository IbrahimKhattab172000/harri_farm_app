import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class AllOffersRepository {
  static Future getData() async {
    return await Network().request(
      Endpoints.ALL_OFFERES,
      method: ServerMethods.GET,
    );
  }
}
