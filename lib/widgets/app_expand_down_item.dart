import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:harri_farm_app/global_bloc/expand_down/cubit.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ExpandDownItem extends StatelessWidget {
  final String question;
  final String answer;

  const ExpandDownItem({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpandDownCubit(),
      child: BlocBuilder<ExpandDownCubit, ExpanedDownState>(
        builder: (context, state) {
          final faqHandler = context.read<ExpandDownCubit>();

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: state.isSelected
                      ? AppColors.primary
                      : AppColors.lightGray,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      faqHandler.update();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                title: question,
                                fontSize: 16,
                                color: AppColors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          state.isSelected
                              ? FeatherIcons.chevronUp
                              : FeatherIcons.chevronDown,
                        ),
                      ],
                    ),
                  ),
                  if (state.isSelected)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: AppText(
                          title: answer,
                          color: AppColors.gray,
                          fontSize: 16,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
