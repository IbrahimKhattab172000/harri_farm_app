import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class SectionsRepository {
  static Future getData({required String catId}) async {
    return await Network().request(
      Endpoints.subCat(catId: catId),
      method: ServerMethods.GET,
    );
  }
}
