import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/change_language/widgets/select_language_toggle_card.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  late String _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = "arabic";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "language".tr(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SelectLanguageToggleCard(
              title: 'arabic',
              isSelected: _selectedLanguage == 'arabic',
              onTap: () {
                setState(() {
                  _selectedLanguage = 'arabic';
                });
              },
            ),
            SizedBox(height: 16.height),
            SelectLanguageToggleCard(
              title: 'english',
              isSelected: _selectedLanguage == 'english',
              onTap: () {
                setState(() {
                  _selectedLanguage = 'english';
                });
              },
            ),
            SizedBox(height: 44.height),
            AppButton(
              title: "confirm".tr(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
