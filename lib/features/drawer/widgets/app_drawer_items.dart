import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_storage.dart';
import 'package:harri_farm_app/features/about_us/bloc/about_us_bloc.dart';
import 'package:harri_farm_app/features/about_us/view/view.dart';
import 'package:harri_farm_app/features/addresses/bloc/addresses_bloc.dart';
import 'package:harri_farm_app/features/contact_us/bloc/contact_us_bloc.dart';
import 'package:harri_farm_app/features/drawer/model/drawer_item_model.dart';
import 'package:harri_farm_app/features/faq/bloc/faq_bloc.dart';
import 'package:harri_farm_app/features/favorite/bloc/favorite_bloc.dart';
import 'package:harri_farm_app/features/login/view/login_view.dart';
import 'package:harri_farm_app/features/my_orders/bloc/my_orders_bloc.dart';
import 'package:harri_farm_app/features/notifications/bloc/notifications_bloc.dart';
import 'package:harri_farm_app/features/privacy_policy/bloc/privacy_policy_bloc.dart';
import 'package:harri_farm_app/features/return_and_exchange_policy/bloc/return_and_exchange_bloc.dart';
import 'package:harri_farm_app/features/shipping_and_delivery_policy/bloc/shipping_policy_bloc.dart';
import 'package:harri_farm_app/features/update_profile/bloc/update_profile_bloc.dart';
import 'package:harri_farm_app/features/update_profile/view/update_profile_view.dart';
import 'package:harri_farm_app/features/addresses/view/addresses_view.dart';
import 'package:harri_farm_app/features/change_language/view/language_view.dart';
import 'package:harri_farm_app/features/contact_us/view/contact_us_view.dart';
import 'package:harri_farm_app/features/drawer/widgets/app_drawer_tile.dart';
import 'package:harri_farm_app/features/faq/view/view.dart';
import 'package:harri_farm_app/features/favorite/view/favorite_view.dart';
import 'package:harri_farm_app/features/my_orders/view/my_orders_view.dart';
import 'package:harri_farm_app/features/notifications/view/notification_view.dart';
import 'package:harri_farm_app/features/privacy_policy/view/view.dart';
import 'package:harri_farm_app/features/return_and_exchange_policy/view/return_and_exchange_view.dart';
import 'package:harri_farm_app/features/shipping_and_delivery_policy/view/shipping_policy_view.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class AppDrawerItems extends StatelessWidget {
  final List<DrawerItemModel> drawerItems = [
    DrawerItemModel(
      imagePath: "setting",
      title: "account_settings",
      onTap: () {
        UpdateProfileBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const UpdateProfileView());
      },
    ),
    DrawerItemModel(
      imagePath: "shopping_bag",
      title: "my_orders",
      onTap: () {
        MyOrdersBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const MyOrdersView());
      },
    ),

    DrawerItemModel(
      imagePath: "heart",
      title: "favorite",
      onTap: () {
        FavouriteBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const FavoriteView());
      },
    ),
    DrawerItemModel(
      imagePath: "location",
      title: "locations",
      onTap: () {
        AddressesBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const AddressesView());
      },
    ),
    DrawerItemModel(
      imagePath: "bell",
      title: "notifications",
      onTap: () {
        NotificationBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const NotificationsView());
      },
    ),
    DrawerItemModel(
      imagePath: "translate",
      title: "language",
      onTap: () {
        RouteUtils.navigateTo(const ChangeLanguageView());
      },
    ),
    DrawerItemModel(
      imagePath: "info",
      title: "about_us",
      onTap: () {
        AboutUsBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const AboutUsView());
      },
    ),
    DrawerItemModel(
      imagePath: "headphones",
      title: "contact_us",
      onTap: () {
        ContactUsBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const ContactUsView());
      },
    ),
    DrawerItemModel(
      imagePath: "lock",
      title: "policy",
      onTap: () {
        PrivacyPolicyBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const PrivacyPolicyView());
      },
    ),
    // DrawerItem(
    //   imagePath: "file",
    //   title: "terms_and_conditions",
    //   onTap: () {
    //     RouteUtils.navigateTo(const TermsAndConditionsView());
    //   },
    // ),
    DrawerItemModel(
      imagePath: "refresh_right_square",
      title: "return_and_exchange_policy",
      onTap: () {
        ReturnAndExchangeBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const ReturnAndExchangePolicyView());
      },
    ),
    DrawerItemModel(
      imagePath: "truck_fast",
      title: "shipping_and_delivery_policy",
      onTap: () {
        ShippingPolicyBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const ShippingAndDeliveryPolicyView());
      },
    ),
    DrawerItemModel(
      imagePath: "help_circle",
      title: "faq",
      onTap: () {
        FaqBloc.of(RouteUtils.context).add(Get());
        RouteUtils.navigateTo(const FaqView());
      },
    ),
    AppStorage.isLogged
        ? DrawerItemModel(
            imagePath: "log_out",
            title: "logout",
            onTap: () {
              AppStorage.signOut();
            },
            noArrow: true,
          )
        : DrawerItemModel(
            imagePath: "log_out",
            title: "login",
            onTap: () {
              RouteUtils.navigateAndPopAll(const LoginView());
            },
            noArrow: true,
          ),
  ];

  AppDrawerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return AppDrawerTile(
          imagePath: drawerItems[index].imagePath,
          onTap: drawerItems[index].onTap,
          title: drawerItems[index].title,
          noArrow: drawerItems[index].noArrow ?? false,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 24.height);
      },
      itemCount: drawerItems.length,
    );
  }
}
