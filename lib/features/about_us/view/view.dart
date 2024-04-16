import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/about_us/bloc/about_us_bloc.dart';
import 'package:harri_farm_app/features/about_us/widgets/about_us_brief.dart';
import 'package:harri_farm_app/features/about_us/widgets/about_us_card.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "about_us".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<AboutUsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final bloc = AboutUsBloc.of(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 30.height),
                    AboutUsBrief(
                        aboutUsBrief: bloc.aboutUsData.data?.about ?? ""),
                    SizedBox(height: 24.height),
                    AboutUsCard(
                        title: "our_view",
                        body: bloc.aboutUsData.data?.ourVision ?? ""),
                    SizedBox(height: 24.height),
                    AboutUsCard(
                        title: "our_mission",
                        body: bloc.aboutUsData.data?.ourMesages ?? ""),
                    SizedBox(height: 24.height),
                    AboutUsCard(
                        title: "our_values",
                        body: bloc.aboutUsData.data?.ourValues ?? ""),
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
