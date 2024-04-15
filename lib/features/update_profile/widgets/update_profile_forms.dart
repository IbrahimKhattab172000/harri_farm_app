import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/update_profile/bloc/update_profile_bloc.dart';
import 'package:harri_farm_app/features/update_profile/models/update_profile_model.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class UpdateProfileForms extends StatelessWidget {
  final UpdateProfileModel userData;
  const UpdateProfileForms({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = UpdateProfileBloc.of(context);
    return Column(
      children: [
        AppTextField(
          label: "name".tr(),
          hint: userData.data?.name ?? "",
          controller: bloc.name,
        ),
        SizedBox(height: 24.height),
        AppTextField(
          label: "phone_number".tr(),
          inputType: TextInputType.number,
          hint: userData.data?.phone ?? "",
          controller: bloc.phone,
        ),
        SizedBox(height: 24.height),
        AppTextField(
          label: "email".tr(),
          hint: userData.data?.email ?? "",
          controller: bloc.email,
        ),
        SizedBox(height: 24.height),
      ],
    );
  }
}
