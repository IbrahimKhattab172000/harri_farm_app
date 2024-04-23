import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/product_details/bloc/product_details_bloc.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_add_button.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_app_bar.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_extra_service.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_info.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_orders_type.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_packaging.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_shredder.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_similar_products.dart';
import 'package:harri_farm_app/features/product_details/widgets/products_details_rating_bar.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ProductDetailsAddToCartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const ProductDetailsAppBar(),
      body: BlocBuilder<ProductDetailsBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final bloc = ProductDetailsBloc.of(context);
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductDetailsInfo(product: bloc.productDetailsData),
                  SizedBox(height: 24.height),
                  ProductDetailsOrderType(product: bloc.productDetailsData),
                  SizedBox(height: 24.height),
                  ProductDetailsExtraService(product: bloc.productDetailsData),
                  SizedBox(height: 24.height),
                  ProductDetailsPackaging(product: bloc.productDetailsData),
                  SizedBox(height: 24.height),
                  ProductDetailsShredder(product: bloc.productDetailsData),
                  SizedBox(height: 24.height),
                  const ProductDetailsRating(),
                  SizedBox(height: 20.height),
                  ProductDetailsSimilarProducts(
                      product: bloc.productDetailsData),
                  SizedBox(height: Utils.bottomDevicePadding + 28),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
