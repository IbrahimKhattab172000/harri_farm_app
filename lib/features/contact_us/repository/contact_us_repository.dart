import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class ContactUsRepository {
  static Future sendData({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.CONTACT_US,
      body: body,
      method: ServerMethods.POST,
    );
  }

  static Future getData() async {
    return await Network().request(
      Endpoints.CONTACT_US_INFO,
      method: ServerMethods.GET,
    );
  }
}
