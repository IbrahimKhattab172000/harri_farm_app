import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/done/widgets/done_buttons.dart';
import 'package:harri_farm_app/features/done/widgets/done_image.dart';
import 'package:harri_farm_app/features/done/widgets/done_title.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class DoneView extends StatelessWidget {
  const DoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DoneImage(),
            SizedBox(height: 40.height),
            const DoneTitle(),
            SizedBox(height: 40.height),
            const DoneButtons(),
          ],
        ),
      ),
    );
  }
}
