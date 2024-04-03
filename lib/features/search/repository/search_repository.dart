import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class SearchRepository {
  static Future getData({required String searchQuery}) async {
    return await Network().request(
      Endpoints.SEARCH,
      body: {"offer": searchQuery},
      method: ServerMethods.POST,
    );
  }
}
