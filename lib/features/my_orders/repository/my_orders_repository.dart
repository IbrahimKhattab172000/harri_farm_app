import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class MyOrdersRepository {
  static Future getMyOrders() async {
    return await Network().request(
      Endpoints.GET_ORDERS,
      method: ServerMethods.GET,
    );
  }
}
