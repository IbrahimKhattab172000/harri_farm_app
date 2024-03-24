import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_toggle_button.dart';

class SelectLanguageToggleCard extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const SelectLanguageToggleCard({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectLanguageToggleCardState();
}

class _SelectLanguageToggleCardState extends State<SelectLanguageToggleCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.background,
          border: Border.all(
            color: widget.isSelected
                ? AppColors.primary
                : AppColors.lightGray.withOpacity(0.2),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            AppToggleButton(
              onChanged: (value) {},
              value: widget.isSelected,
              color: widget.isSelected ? Colors.white : AppColors.primary,
            ),
            SizedBox(width: 12.width),
            AppText(
              title: widget.title.tr(),
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
