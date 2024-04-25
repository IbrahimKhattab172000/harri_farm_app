import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/contact_us/bloc/contact_us_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ContactUsForms extends StatelessWidget {
  const ContactUsForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final bloc = ContactUsBloc.of(context);

          return Form(
            key: bloc.contactUsFormKey,
            child: Column(
              children: [
                AppTextField(
                  label: "name".tr(),
                  controller: bloc.nameController,
                ),
                SizedBox(height: 24.height),
                AppTextField(
                  label: "phone_number".tr(),
                  inputType: TextInputType.number,
                  controller: bloc.phoneController,
                ),
                SizedBox(height: 24.height),
                AppTextField(
                  label: "email".tr(),
                  controller: bloc.emailController,
                ),
                SizedBox(height: 24.height),
                AppTextField(
                  label: "message_body".tr(),
                  hint: "leave_the_message_here".tr(),
                  maxLines: 4,
                  controller: bloc.messageController,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
