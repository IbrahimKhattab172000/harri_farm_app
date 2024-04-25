import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart'; // Import GetStorage package
import 'package:harri_farm_app/features/change_language/widgets/select_language_toggle_card.dart';
import 'package:harri_farm_app/features/splash/view/splash_view.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ChangeLanguageView extends StatefulWidget {
  const ChangeLanguageView({super.key});

  @override
  State<ChangeLanguageView> createState() => _ChangeLanguageViewState();
}

class _ChangeLanguageViewState extends State<ChangeLanguageView> {
  late String _selectedLanguage;

  final GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    _selectedLanguage = box.read('language') ?? (Utils.isAR ? "ar" : "en");
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
              isSelected: _selectedLanguage == 'ar',
              onTap: () {
                setState(() {
                  _selectedLanguage = 'ar';
                });
              },
            ),
            SizedBox(height: 16.height),
            SelectLanguageToggleCard(
              title: 'english',
              isSelected: _selectedLanguage == 'en',
              onTap: () {
                setState(() {
                  _selectedLanguage = 'en';
                });
              },
            ),
            SizedBox(height: 44.height),
            AppButton(
              title: "confirm".tr(),
              onTap: () {
                box.write('language', _selectedLanguage);
                context.setLocale(Locale(_selectedLanguage));
                final rootElement =
                    WidgetsFlutterBinding.ensureInitialized().rootElement!;
                WidgetsBinding.instance.buildOwner!.reassemble(rootElement);
                RouteUtils.navigateAndPopAll(const SplashView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
