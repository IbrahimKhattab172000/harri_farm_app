import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AppDrawerView extends StatelessWidget {
  const AppDrawerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(height: Utils.topDevicePadding + 40),
            Center(
              child: Image.asset(
                Utils.getAssetPNGPath("logo"),
                height: 72.height,
                width: 72.width,
              ),
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "setting",
              title: "account_settings",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "shopping_bag",
              title: "my_orders",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "heart",
              title: "favorite",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "location",
              title: "locations",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "bell",
              title: "notifications",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "translate",
              title: "language",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "info",
              title: "us",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "headphones",
              title: "contact_us",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "lock",
              title: "policy",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "file",
              title: "term_and_conditions",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "refresh_right_square",
              title: "return_and_exchange_policy",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "truck_fast",
              title: "shipping_and_delivery_policy",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "help_circle",
              title: "faq",
              onTap: () {},
            ),
            SizedBox(height: 24.height),
            AppDrawerTile(
              imagePath: "log_out",
              title: "logout",
              onTap: () {},
            ),
            SizedBox(height: Utils.bottomDevicePadding + 36)
          ],
        ),
      ),
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  const AppDrawerTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            Utils.getAssetPNGPath(imagePath),
            height: 28.height,
            width: 28.width,
          ),
          SizedBox(width: 16.width),
          AppText(
            title: title.tr(),
            fontSize: 14,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 20),
        ],
      ),
    );
  }
}
