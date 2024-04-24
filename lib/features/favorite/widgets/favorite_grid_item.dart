import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/favorite/bloc/favorite_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/main_models/product_model.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';

class FavoriteGridItems extends StatelessWidget {
  // final FavouriteModel favModel;
  const FavoriteGridItems({
    Key? key,
    //  required this.favModel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final bloc = FavouriteBloc.of(context);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.height,
                crossAxisSpacing: 32.width,
                childAspectRatio: 2 / 3.6,
              ),
              itemCount: bloc.favouriteData.data?.product?.length ?? 0,
              itemBuilder: (context, index) {
                return AppProductCard(
                  isFavorite:
                      bloc.favouriteData.data?.product?[index].like ?? false,
                  product: bloc.favouriteData.data?.product?[index] ??
                      ProductModel(),
                  onFavoriteChanged: (isFav) {
                    FavouriteBloc.of(context).add(
                      Click(
                        arguments: {
                          "product_id":
                              bloc.favouriteData.data?.product?[index].id,
                          "like": isFav,
                        },
                      ),
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
