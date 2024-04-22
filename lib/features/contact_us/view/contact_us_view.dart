import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/contact_us/bloc/contact_us_bloc.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_additional_contacts.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_forms.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_send_button.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_social_media.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "contact_us".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<ContactUsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final bloc = ContactUsBloc.of(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 22.height),
                    const ContactUsForms(),
                    SizedBox(height: 24.height),
                    const ContactUsSendButton(),
                    SizedBox(height: 24.height),
                    ContactUsAdditionalContacts(
                        contactUsModel: bloc.contactUsModel),
                    SizedBox(height: 24.height),
                    ContactUsSocialMedia(contactUsModel: bloc.contactUsModel),
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
