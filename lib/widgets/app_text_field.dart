import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.hint,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.inputType = TextInputType.text,
    this.onTap,
    this.trailing,
    this.leading,
    this.label,
    this.maxLines = 1,
    this.borderColor = Colors.transparent,
    this.fillColor = AppColors.border,
    this.onSaved,
    this.onChanged,
    this.controller,
    this.secure = false,
    this.hintColor,
    this.transperent,
  });

  final String? hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction textInputAction;
  final TextInputType inputType;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? leading;
  final String? label;
  final int maxLines;
  final Color borderColor;
  final Color fillColor;
  final bool secure;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final Color? hintColor;
  final bool? transperent;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 8.height),
            child: AppText(
              title: widget.label!,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
        InkWell(
          radius: _radius,
          onTap: widget.onTap != null
              ? () {
                  Utils.dismissKeyboard();
                  widget.onTap!();
                }
              : null,
          borderRadius: BorderRadius.circular(_radius),
          child: AbsorbPointer(
            absorbing: widget.onTap != null,
            child: TextFormField(
              controller: widget.controller,
              cursorColor: AppColors.black,
              cursorHeight: 20,
              validator: widget.validator,
              onChanged: widget.onChanged,
              textInputAction: TextInputAction.done,
              keyboardType: widget.inputType,
              maxLines: widget.maxLines,
              onSaved: widget.onSaved,
              obscureText: widget.secure,
              decoration: InputDecoration(
                hintText: widget.hint ?? '',
                fillColor: widget.fillColor,
                filled: true,
                hintStyle: TextStyle(
                  color: widget.hintColor ?? AppColors.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: widget.trailing,
                prefixIcon: widget.leading,
                contentPadding: EdgeInsets.symmetric(
                    horizontal: 12.width, vertical: 8.height),
                border: _border((widget.transperent ?? false)
                    ? Colors.transparent
                    : widget.borderColor),
                enabledBorder: _border((widget.transperent ?? false)
                    ? Colors.transparent
                    : widget.borderColor),
                focusedBorder: _border(
                    (widget.transperent ?? false)
                        ? Colors.transparent
                        : AppColors.primary,
                    width: 1),
                errorBorder: _border((widget.transperent ?? false)
                    ? Colors.transparent
                    : AppColors.red),
                focusedErrorBorder: _border(
                    (widget.transperent ?? false)
                        ? Colors.transparent
                        : AppColors.background,
                    width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  double get _radius => widget.maxLines > 1 ? 8 : 10;
}
