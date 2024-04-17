import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/addresses/bloc/addresses_bloc.dart';
import 'package:harri_farm_app/features/addresses/widgets/addresses_add_address_bar.dart';
import 'package:harri_farm_app/features/addresses/widgets/addresses_list.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "addresses".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<AddressesBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(
              child: AppText(title: 'error_loading_data'.tr()),
            );
          } else {
            final bloc = AddressesBloc.of(context);
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 24.height),
                    const AddressesAddBar(),
                    SizedBox(height: 24.height),
                    AddressesList(addresses: bloc.addressesData.addresses!),
                    SizedBox(height: Utils.bottomDevicePadding),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
