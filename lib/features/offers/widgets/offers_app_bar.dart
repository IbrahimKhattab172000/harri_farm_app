import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class OffersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OffersAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppAppBar(
      leading: InkWell(
        onTap: () => RouteUtils.pop(),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
      ),
      title: "offers".tr(),
      elevation: 0,
    );
  }
}
