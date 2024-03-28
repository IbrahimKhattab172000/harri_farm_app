// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:pinput/pinput.dart';

class AppPinCodeField extends StatelessWidget {
  final void Function(String?)? onSave;
  final void Function(String) onChanged;
  TextEditingController? controller;

  AppPinCodeField({
    Key? key,
    this.onSave,
    required this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.width),
      child: Directionality(
        textDirection: Utils.isAR ? TextDirection.ltr : TextDirection.rtl,
        child: Pinput(
          key: UniqueKey(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'empty_field'.tr();
            } else if (value.length != 4) {
              return "otp_code_validation".tr();
            }
            return null;
          },
          // autovalidateMode: AutovalidateMode.disabled,
          // cursorColor: AppColors.primary,
          // autoDisposeControllers: true,
          // autoDismissKeyboard: true,
          controller: controller,
          // enablePinAutofill: true,
          keyboardType: TextInputType.number,
          // animationType: AnimationType.fade,
          // textStyle: const TextStyle(
          //   fontSize: 16,
          //   fontWeight: FontWeight.w700,
          //   color: AppColors.black,
          // ),
          // pastedTextStyle: const TextStyle(color: AppColors.black),
          // pinTheme: PinTheme(
          //   shape: PinCodeFieldShape.box,
          //   selectedColor: AppColors.white,
          //   borderRadius: BorderRadius.circular(12),
          //   activeColor: AppColors.primary,
          //   inactiveColor: AppColors.white,
          //   fieldWidth: 64.width,
          //   fieldHeight: 64.height,
          //   activeFillColor: AppColors.primary.withOpacity(0.5),
          //   inactiveFillColor: AppColors.lightGray.withOpacity(0.5),
          //   selectedFillColor: AppColors.primary.withOpacity(0.5),
          //   selectedBorderWidth: 2,
          //   disabledBorderWidth: 1,
          //   inactiveBorderWidth: 1,
          //   activeBorderWidth: 2,
          //   errorBorderWidth: 1,
          //   borderWidth: 1,
          // ),
          // enableActiveFill: true,
          // appContext: context,
          length: 4,
          // onSaved: onSave,
          onChanged: onChanged,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // errorTextSpace: 30,
        ),
      ),
    );
  }
}
