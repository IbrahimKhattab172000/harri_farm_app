import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/update_profile/bloc/update_profile_bloc.dart';
import 'package:harri_farm_app/features/update_profile/widgets/update_profile_buttons.dart';
import 'package:harri_farm_app/features/update_profile/widgets/update_profile_forms.dart';
import 'package:harri_farm_app/features/update_profile/widgets/update_profile_image.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_empty_screen.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "account_settings".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<UpdateProfileBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UnAuthorized) {
            return const AppEmptyScreen(title: "sign_up_to_access_this_data");
          } else if (state is Error) {
            return Center(child: AppText(title: 'error_loading_data'.tr()));
          } else if (state is Done) {
            final bloc = UpdateProfileBloc.of(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 18.height),
                    const UpdateProfileProfileImage(),
                    SizedBox(height: 8.height),
                    UpdateProfileForms(userData: bloc.userData),
                    SizedBox(height: 44.height),
                    const UpdateProfileButtons(),
                    SizedBox(height: Utils.bottomDevicePadding),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
