import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/privacy_policy/bloc/privacy_policy_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "policy".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<PrivacyPolicyBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final bloc = PrivacyPolicyBloc.of(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 30.height),
                    AppText(
                      title: bloc.privacyPolicyData.data?.title ?? "",
                      fontSize: 16,
                      color: Colors.black,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
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
