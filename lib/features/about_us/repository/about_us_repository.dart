import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class AboutUsRepositroy {
  static Future getAbouUsData() async {
    return await Network().request(
      Endpoints.ABOUT_US,
      method: ServerMethods.GET,
    );
  }
}
