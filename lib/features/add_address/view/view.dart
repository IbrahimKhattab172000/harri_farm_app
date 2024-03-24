import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/add_address/widgets/add_address_button.dart';
import 'package:harri_farm_app/features/add_address/widgets/add_address_forms.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class AddAddressView extends StatelessWidget {
  const AddAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "adding_address".tr(),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const AddAddressForms(),
                SizedBox(height: 40.height),
                const AddAddressButton(),
                SizedBox(height: 24.height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
