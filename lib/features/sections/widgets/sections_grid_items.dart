import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/sections/bloc/section_items_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class SectionGridItems extends StatelessWidget {
  const SectionGridItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionItemsBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Error) {
          return Center(child: AppText(title: 'error_loading_data'.tr()));
        } else {
          final bloc = SectionItemsBloc.of(context);
          return Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.width,
                crossAxisSpacing: 8.height,
                childAspectRatio: 2 / 3,
              ),
              itemCount: bloc.subcategoryOffersModel.data?.offer?.length ?? 0,
              itemBuilder: (context, index) {
                return AppProductCard(
                    product: bloc.subcategoryOffersModel.data!.offer![index],
                    isFavorite:
                        bloc.subcategoryOffersModel.data!.offer![index].like ??
                            false);
              },
            ),
          );
        }
      },
    );
  }
}
