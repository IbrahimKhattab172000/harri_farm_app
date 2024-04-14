// ignore_for_file: constant_identifier_names

class Endpoints {
  static const String REGISTER = "register";
  static const String LOGIN = "login";
  static const String FORGETPASSWORD = "resendcode";
  static const String VERIFYCODE = "verifycode";
  static const String RESETPASSWORD = "forgetpassword";
  static const String HOME = "home";
  static const String SEARCH = "search";
  static const String ALLOFFERES = "show-all-offer";
  static const String NOTIFICATIONS = "notifications";

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
