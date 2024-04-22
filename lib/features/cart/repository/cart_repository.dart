import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class CartRepository {
  static Future getData() async {
    return await Network().request(
      Endpoints.SHOW_CART,
      method: ServerMethods.GET,
    );
  }

  static Future deleteAllCartData() async {
    return await Network().request(
      Endpoints.DELETE_CART,
      method: ServerMethods.GET,
    );
  }

  static Future deleteItemCartData({required String offerId}) async {
    return await Network().request(
      Endpoints.DELETE_ITEM_CART,
      method: ServerMethods.POST,
      body: {"offer_id": offerId},
    );
  }

  static Future increaseCartItem({required String offerId}) async {
    return await Network().request(
      Endpoints.INCREASE_CART_ITEM,
      method: ServerMethods.POST,
      body: {"offer_id": offerId},
    );
  }

  static Future decreaseCartItem({required String offerId}) async {
    return await Network().request(
      Endpoints.DECREASE_CART_ITEM,
      method: ServerMethods.POST,
      body: {"offer_id": offerId},
    );
  }

  static Future addCoupon({required String code}) async {
    return await Network().request(
      Endpoints.ADD_COUPON,
      method: ServerMethods.POST,
      body: {"code": code},
    );
  }
}
