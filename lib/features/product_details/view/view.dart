import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_add_button.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_app_bar.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_describtion.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_extra_service.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_image.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_item_count.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_orders_type.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_packaging.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_price.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_rating_card.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_shredder.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_similar_products.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_type.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_weight.dart';
import 'package:harri_farm_app/features/product_details/widgets/products_details_rating_bar.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ProductDetailsAppBar(),
      body: AppDecoratedBackGround(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProductDetailsImage(),
                SizedBox(height: 24.height),
                const ProductDetailsItemsCount(),
                SizedBox(height: 14.height),
                const ProductDetailsPrice(),
                SizedBox(height: 14.height),
                const ProductsDetailsType(),
                SizedBox(height: 14.height),
                const ProductDetailsWeight(),
                SizedBox(height: 24.height),
                const ProductDetailsDescribtion(),
                SizedBox(height: 24.height),
                const ProductDetailsOrderType(),
                SizedBox(height: 24.height),
                const ProductDetailsExtraService(),
                SizedBox(height: 24.height),
                const ProductDetailsPackaging(),
                SizedBox(height: 24.height),
                const ProductDetailsShredder(),
                SizedBox(height: 24.height),
                const ProductDetailsRatingBar(),
                SizedBox(height: 10.height),
                const ProductDetailsRatingCard(),
                SizedBox(height: 10.height),
                const ProductDetailsRatingCard(),
                SizedBox(height: 20.height),
                const ProductDetailsAddToCartButton(),
                SizedBox(height: 20.height),
                const ProductDetailsSimilarProducts(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
