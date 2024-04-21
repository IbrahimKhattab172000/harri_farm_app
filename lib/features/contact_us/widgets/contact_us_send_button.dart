import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/contact_us/bloc/contact_us_bloc.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ContactUsSendButton extends StatelessWidget {
  const ContactUsSendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsBloc, AppState>(
      builder: (context, state) {
        return AppButton(
          title: "send".tr(),
          onTap: () {
            ContactUsBloc.of(context).add(Click());
          },
        );
      },
    );
  }
}
