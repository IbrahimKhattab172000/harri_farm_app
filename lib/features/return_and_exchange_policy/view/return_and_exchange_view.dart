import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/return_and_exchange_policy/bloc/return_and_exchange_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_expand_down_item.dart';

class ReturnAndExchangePolicyView extends StatelessWidget {
  ReturnAndExchangePolicyView({
    super.key,
  });

  // // Define your list of questions and answers
  // final List<Map<String, String>> policyItems = [
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
        title: "return_and_exchange_policy".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<ReturnAndExchangeBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final bloc = ReturnAndExchangeBloc.of(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bloc.returnAndExchangeData.data?.length ?? 0,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: 14.height),
                  itemBuilder: (context, index) {
                    var item = bloc.returnAndExchangeData.data?[index];
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
