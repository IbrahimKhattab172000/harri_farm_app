import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/faq/bloc/faq_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_expand_down_item.dart';

class FaqView extends StatelessWidget {
  const FaqView({
    super.key,
  });

  // final List<Map<String, String>> faqItems = [
  //   {
  //     "question": "when_is_the_exchange_and_return_available".tr(),
  //     "answer": "dummy_text".tr(),
  //   },
  //   {
  //     "question": "what_is_harri_store_all_about".tr(),
  //     "answer": "dummy_text".tr(),
  //   },
  //   {
  //     "question": "what_is_harri_store_all_about".tr(),
  //     "answer": "dummy_text".tr(),
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "faq".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<FaqBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final bloc = FaqBloc.of(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bloc.faqData.data?.length ?? 0,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: 14.height),
                  itemBuilder: (context, index) {
                    final item = bloc.faqData.data?[index];
                    return ExpandDownItem(
                      question: item?.question ?? "",
                      answer: item?.answer ?? "",
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
