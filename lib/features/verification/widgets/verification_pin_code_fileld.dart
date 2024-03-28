import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/verification/bloc/verification_bloc.dart';
import 'package:harri_farm_app/widgets/app_pin_code_field.dart';

class VerificationPinCodeField extends StatelessWidget {
  const VerificationPinCodeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = VerificationBloc.of(context);
    return Form(
      key: bloc.formKey,
      child: AppPinCodeField(
        controller: bloc.codeController,
        onChanged: (code) {},
      ),
    );
  }
}
