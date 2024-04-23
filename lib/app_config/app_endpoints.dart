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
  static const String ADD_CART = "add-cart";
  static const String SHOW_CART = "show-cart";
  static const String CONTACT_US_INFO = "setting";
  static const String DELETE_CART = "delete-cart";
  static const String DELETE_ITEM_CART = "delete-cart-item";
  static const String INCREASE_CART_ITEM = "increase-cart-item";
  static const String DECREASE_CART_ITEM = "decrease-cart-item";
  static const String ADD_COUPON = "add-coupon";
  static const String ADD_ORDER = "add-order";

  static String getRegions({required String cityId}) {
    return "area/$cityId";
  }

  static String getOfferDetails({required String offerId}) {
    return "offer/$offerId";
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
