import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/sections/bloc/section_items_bloc.dart';
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
  int? selectedIndex;

  final List<Map<String, dynamic>> filters = [
    {
      "id": 0,
      "title": "الكل",
      "titleEn": "all",
    },
    {
      "id": 1,
      "title": "الاكثر مبيعا",
      "titleEn": "Best seller",
    },
    {
      "id": 2,
      "title": "الاعلى تقييمًا",
      "titleEn": "Highest rated",
    },
    {
      "id": 3,
      "title": "من السعر الاعلي الي الاقل",
      "titleEn": "From the highest price to the lowest",
    },
    {
      "id": 4,
      "title": "من السعر الاقل الي الاعلى",
      "titleEn": "From the lowest price to the highest",
    },
  ];

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
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return AppToggleCard(
                      title: Utils.isAR ? filter["title"] : filter['titleEn'],
                      isSelected: selectedIndex == filter["id"],
                      onTap: () {
                        setState(() {
                          selectedIndex = filter["id"];
                          SectionItemsBloc.of(context)
                              .add(Click(arguments: selectedIndex.toString()));
                        });
                      },
                    );
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
