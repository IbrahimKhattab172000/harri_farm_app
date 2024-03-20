import 'package:flutter/material.dart';
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
import 'package:harri_farm_app/widgets/app_decorated_background.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ProductDetailsAddToCartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: const ProductDetailsAppBar(),
      body: AppDecoratedBackGround(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProductDetailsInfo(),
              SizedBox(height: 24.height),
              const ProductDetailsOrderType(),
              SizedBox(height: 24.height),
              const ProductDetailsExtraService(),
              SizedBox(height: 24.height),
              const ProductDetailsPackaging(),
              SizedBox(height: 24.height),
              const ProductDetailsShredder(),
              SizedBox(height: 24.height),
              const ProductDetailsRating(),
              SizedBox(height: 20.height),
              const ProductDetailsSimilarProducts(),
              SizedBox(height: Utils.bottomDevicePadding + 28),
            ],
          ),
        ),
      ),
    );
  }
}
