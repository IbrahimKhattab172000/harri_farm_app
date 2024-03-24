import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/addresses/widgets/addresses_add_address_bar.dart';
import 'package:harri_farm_app/features/addresses/widgets/addresses_list.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "addresses".tr(),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const AddressesList(),
            SizedBox(height: 24.height),
            const AddressesAddBar(),
          ],
        ),
      ),
    );
  }
}
