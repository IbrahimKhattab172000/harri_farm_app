import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class NotificationsRepository {
  static Future getData() async {
    return await Network().request(
      Endpoints.NOTIFICATIONS,
      method: ServerMethods.GET,
    );
  }
}
