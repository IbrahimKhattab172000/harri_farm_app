// ignore_for_file: constant_identifier_names

class Endpoints {
  static const String REGISTER = "register";
  static const String LOGIN = "login";
  static const String FORGET_PASSWORD = "resendcode";
  static const String VERIFY_CODE = "verifycode";
  static const String RESET_PASSWORD = "forgetpassword";
  static const String HOME = "home";
  static const String SEARCH = "search";
  static const String ALL_OFFERES = "show-all-offer";
  static const String NOTIFICATIONS = "notifications";
  static const String USER = "user";
  static const String UPDATE = "update";
  static const String GET_ORDERS = "get-orders";
  static const String GET_ORDERS_DETAILS = "order-details";
  static const String RATE_SERVICE = "rate-service";
  static const String SHIPPING_POLICY = "shipping_delivery";
  static const String EXCHANGE_POLICY = "exchange_policy";
  static const String FAQ = "qustions";
  static const String PRIVACY_POLICY = "privacy";
  static const String ABOUT_US = "aboutus";
  static const String FAVOURITE = "favorite";
  static const String LIKE = "like";
  static const String FETCH_ADDRESS = "fetch-address";
  static const String ADD_ADDRESS = "save-address";
  static const String GET_CITIES = "city";
  static const String CONTACT_US = "contactUs";

  static String getRegions({required String cityId}) {
    return "area/$cityId";
  }

  static String subCat({required String catId}) {
    return "category/$catId/subcategory";
  }

  static String subCategoryOffers({
    required String subId,
  }) {
    return "category/$subId/offers";
  }

  static String filters({
    required String catId,
  }) {
    return "category/$catId/offers";
  }
}
