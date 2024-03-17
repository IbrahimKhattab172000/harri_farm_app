import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
  }

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
                const SectionArrangingToggle(
                  title: "الاكثر مبيعا",
                  color: AppColors.primary,
                  isSelected: true,
                ),
                const SectionArrangingToggle(
                  title: "الاعلى تقيما",
                  color: AppColors.black,
                  isSelected: false,
                ),
                const SectionArrangingToggle(
                  title: " من السعر الاعلي الي الاقل",
                  color: AppColors.black,
                  isSelected: false,
                ),
                const SectionArrangingToggle(
                  title: " من السعر الاقل الي الاعلى",
                  color: AppColors.black,
                  isSelected: false,
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

class SectionArrangingToggle extends StatelessWidget {
  final String title;
  final Color color;
  final bool isSelected;
  const SectionArrangingToggle({
    super.key,
    required this.title,
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 24.width,
            height: 24.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.lightGray,
                width: isSelected ? 5 : 1,
              ),
            ),
          ),
          SizedBox(width: 10.width),
          AppText(
            title: title,
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
