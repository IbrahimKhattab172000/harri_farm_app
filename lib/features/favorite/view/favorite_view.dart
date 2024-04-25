import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/favorite/bloc/favorite_bloc.dart';
import 'package:harri_farm_app/features/favorite/widgets/favorite_grid_item.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_empty_screen.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "favorite".tr(),
        leading: InkWell(
          onTap: () => RouteUtils.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<FavouriteBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(
              child: AppText(title: 'error_loading_data'.tr()),
            );
          } else if (state is UnAuthorized) {
            return const AppEmptyScreen(title: "sign_up_to_access_this_data");
          } else if (state is Empty) {
            return const AppEmptyScreen(
                title: "add_some_products_to_your_cart");
          } else if (state is Done) {
            return const SafeArea(
              child: FavoriteGridItems(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
