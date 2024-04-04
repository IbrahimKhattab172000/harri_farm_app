import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/all_offers/bloc/all_offers_bloc.dart';
import 'package:harri_farm_app/features/all_offers/widgets/all_offers_slider.dart';
import 'package:harri_farm_app/features/all_offers/widgets/offers_app_bar.dart';
import 'package:harri_farm_app/features/all_offers/widgets/offers_grid_items.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OffersAppBar(),
      body: AppDecoratedBackGround(
        child: BlocBuilder<AllOffersBloc, AppState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is Done) {
              return Column(
                children: [
                  SizedBox(height: 30.height),
                  const AllOffersSlider(),
                  SizedBox(height: 32.height),
                  const OffersGridItems(),
                ],
              );
            } else if (state is Error) {
              return Center(
                child: AppText(title: 'error_loading_data'.tr()),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
