import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

abstract class UpdateProfileRepository {
  static Future getData() async {
    return await Network().request(
      Endpoints.USER,
      method: ServerMethods.GET,
    );
  }

  static Future updateProfile({Map<String, dynamic>? updatedData}) async {
    return await Network().request(
      Endpoints.UPDATE,
      method: ServerMethods.POST,
      body: updatedData,
    );
  }
}
