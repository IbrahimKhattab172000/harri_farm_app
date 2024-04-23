import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class ShippingAddressRepositroy {
  static Future getAddressDataShipping() async {
    return await Network().request(
      Endpoints.FETCH_ADDRESS,
      method: ServerMethods.GET,
    );
  }
}
