import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class AddAddressRepositroy {
  static Future addAddress({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.ADD_ADDRESS,
      method: ServerMethods.POST,
      body: body,
    );
  }

  static Future getCities() async {
    return await Network().request(
      Endpoints.GET_CITIES,
      method: ServerMethods.GET,
    );
  }

  static Future getRegions({
    required String cityId,
  }) async {
    return await Network().request(
      Endpoints.getRegions(
        cityId: cityId,
      ),
      method: ServerMethods.GET,
    );
  }
}
