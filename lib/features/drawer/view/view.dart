import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/drawer/widgets/app_drawer_image.dart';
import 'package:harri_farm_app/features/drawer/widgets/app_drawer_items.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

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
            const AppDrawerImage(),
            SizedBox(height: 24.height),
            AppDrawerItems(),
            SizedBox(height: Utils.bottomDevicePadding + 36)
          ],
        ),
      ),
    );
  }
}
