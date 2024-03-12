import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_pin_code_field.dart';

class VerificationPinCodeField extends StatelessWidget {
  const VerificationPinCodeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppPinCodeField(
      onChanged: (code) {},
    );
  }
}
