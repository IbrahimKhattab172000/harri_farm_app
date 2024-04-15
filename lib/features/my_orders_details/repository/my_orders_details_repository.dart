import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class MyOrdersDetailsRepository {
  static Future getMyOrdersDetails({required String orderId}) async {
    return await Network().request(
      Endpoints.GET_ORDERS_DETAILS,
      method: ServerMethods.POST,
      body: {"order_id": orderId},
    );
  }
}
