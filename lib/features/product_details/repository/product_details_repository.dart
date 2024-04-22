import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class ProductDetailsRepo {
  static Future getOfferDetailsData({
    required String offerId,
  }) async {
    return await Network().request(
      Endpoints.getOfferDetails(
        offerId: offerId,
      ),
      method: ServerMethods.GET,
    );
  }

  static Future addToCart({
    required Map<String, dynamic> body,
  }) async {
    return await Network().request(
      Endpoints.ADD_CART,
      method: ServerMethods.POST,
      body: body,
    );
  }
}
