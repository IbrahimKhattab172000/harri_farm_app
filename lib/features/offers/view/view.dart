import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/offers/widgets/offers_app_bar.dart';
import 'package:harri_farm_app/features/offers/widgets/offers_grid_items.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/widgets/app_slider.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OffersAppBar(),
      body: AppDecoratedBackGround(
        child: Column(
          children: [
            SizedBox(height: 30.height),
            const AppSlider(),
            SizedBox(height: 32.height),
            const OffersGridItems(),
          ],
        ),
      ),
    );
  }
}
