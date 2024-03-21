import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/drawer/widgets/app_drawer_tile.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class AppDrawerItems extends StatelessWidget {
  final List<Map<String, dynamic>> drawerItems = [
    {
      "imagePath": "setting",
      "title": "account_settings",
      "onTap": () {},
    },
    {
      "imagePath": "shopping_bag",
      "title": "my_orders",
      "onTap": () {},
    },
    {
      "imagePath": "heart",
      "title": "favorite",
      "onTap": () {},
    },
    {
      "imagePath": "location",
      "title": "locations",
      "onTap": () {},
    },
    {
      "imagePath": "bell",
      "title": "notifications",
      "onTap": () {},
    },
    {
      "imagePath": "translate",
      "title": "language",
      "onTap": () {},
    },
    {
      "imagePath": "info",
      "title": "us",
      "onTap": () {},
    },
    {
      "imagePath": "headphones",
      "title": "contact_us",
      "onTap": () {},
    },
    {
      "imagePath": "lock",
      "title": "policy",
      "onTap": () {},
    },
    {
      "imagePath": "file",
      "title": "term_and_conditions",
      "onTap": () {},
    },
    {
      "imagePath": "refresh_right_square",
      "title": "return_and_exchange_policy",
      "onTap": () {},
    },
    {
      "imagePath": "truck_fast",
      "title": "shipping_and_delivery_policy",
      "onTap": () {},
    },
    {
      "imagePath": "help_circle",
      "title": "faq",
      "onTap": () {},
    },
    {
      "imagePath": "log_out",
      "title": "logout",
      "onTap": () {},
      "isLogout": true,
    },
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
          imagePath: drawerItems[index]['imagePath'],
          onTap: drawerItems[index]['onTap'],
          title: drawerItems[index]['title'],
          isLogout: drawerItems[index]['isLogout'] ?? false,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 24.height);
      },
      itemCount: drawerItems.length,
    );
  }
}
