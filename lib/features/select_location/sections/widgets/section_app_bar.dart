import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/sections/widgets/section_bottom_sheet.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class SectionsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SectionsAppBar({Key? key}) : super(key: key);

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
      title: "sections".tr(),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              SectionBottomSheet.show();
            },
            child: Image.asset(
              Utils.getAssetPNGPath("sort"),
              width: 24.width,
              height: 24.height,
            ),
          ),
        ),
      ],
    );
  }
}
