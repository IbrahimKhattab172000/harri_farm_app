import 'package:harri_farm_app/app_config/app_endpoints.dart';
import 'package:harri_farm_app/network/network_layer.dart';

class SectionsRepository {
  static Future getData({required String catId}) async {
    return await Network().request(
      Endpoints.subCat(catId: catId),
      method: ServerMethods.GET,
    );
  }

  static Future getSubCategoryOffersData({
    required String subId,
  }) async {
    return await Network().request(
      Endpoints.subCategoryOffers(
        subId: subId,
      ),
      method: ServerMethods.GET,
    );
  }

  static Future filter({
    required String catId,
    required String filterId,
  }) async {
    return await Network().request(
      Endpoints.subCategoryOffers(
        subId: catId,
      ),
      method: ServerMethods.GET,
      query: {"type": filterId},
    );
  }
}
