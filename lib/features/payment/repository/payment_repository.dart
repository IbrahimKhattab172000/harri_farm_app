import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class PaymentRepository {
  static Future addPaymentOrder({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.ADD_ORDER,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
