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
