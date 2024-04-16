import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class FavouriteRepository {
  static Future getData() async {
    return await Network().request(
      Endpoints.FAVOURITE,
      method: ServerMethods.GET,
    );
  }

  static Future setFavorite({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.LIKE,
      method: ServerMethods.POST,
      body: body,
    );
  }
}
