import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_toggle.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class SectionBottomSheet extends StatefulWidget {
  const SectionBottomSheet({
    Key? key,
  }) : super(key: key);

  static Future<int?> show() {
    return showModalBottomSheet(
      context: RouteUtils.context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      builder: (context) {
        return const SectionBottomSheet();
      },
    );
  }

  @override
  State<SectionBottomSheet> createState() => _SectionBottomSheetState();
}

class _SectionBottomSheetState extends State<SectionBottomSheet> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        onClosing: () {},
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    AppText(
                      title: "arrange_by".tr(),
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    InkWell(
                      onTap: () {
                        RouteUtils.pop();
                      },
                      child: Image.asset(
                        Utils.getAssetPNGPath("close_circle"),
                        width: 24.width,
                        height: 24.height,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.height),
                AppToggleCard(
                  title: "الاكثر مبيعا",
                  isSelected: selectedIndex == 0,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
                AppToggleCard(
                  title: "الاعلى تقيما",
                  isSelected: selectedIndex == 1,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
                AppToggleCard(
                  title: "من السعر الاعلي الي الاقل",
                  isSelected: selectedIndex == 2,
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                ),
                AppToggleCard(
                  title: "من السعر الاقل الي الاعلى",
                  isSelected: selectedIndex == 3,
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                ),
                SizedBox(height: 24.height),
              ],
            ),
          );
        },
      ),
    );
  }
}
