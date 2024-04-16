import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/favorite/bloc/favorite_bloc.dart';
import 'package:harri_farm_app/features/favorite/widgets/favorite_grid_item.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
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
          final bloc = FavouriteBloc.of(context);

          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(
              child: AppText(title: 'error_loading_data'.tr()),
            );
          } else if (bloc.favouriteData.data!.product!.isEmpty) {
            return const Center(
              child: AppText(title: 'empty'),
            );
          } else {
            return const SafeArea(
              child: FavoriteGridItems(),
            );
          }
        },
      ),
    );
  }
}
