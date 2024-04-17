import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class AddressesRepositroy {
  static Future getAddressData() async {
    return await Network().request(
      Endpoints.FETCH_ADDRESS,
      method: ServerMethods.GET,
    );
  }
}
