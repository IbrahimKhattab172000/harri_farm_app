// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/all_offers/models/all_offers_model.dart';
import 'package:harri_farm_app/features/cart/view/cart_view.dart';
import 'package:harri_farm_app/features/favorite/bloc/favorite_bloc.dart';
import 'package:harri_farm_app/features/product_details/bloc/product_details_bloc.dart';
import 'package:harri_farm_app/features/product_details/view/product_details_view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AppSimilarProductCard extends StatefulWidget {
  bool isFavorite;
  final Function(bool)? onFavoriteChanged;
  final SimilarProduct? similarProduct;

  AppSimilarProductCard({
    Key? key,
    required this.isFavorite,
    this.onFavoriteChanged,
    this.similarProduct,
  }) : super(key: key);

  @override
  State<AppSimilarProductCard> createState() => _AppProductCardState();
}

class _AppProductCardState extends State<AppSimilarProductCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ProductDetailsBloc.of(context)
            .add(Get(arguments: widget.similarProduct?.id.toString()));
        RouteUtils.navigateTo(const ProductDetailsView());
      },
      child: Container(
        width: 146.width,
        color: AppColors.background,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    widget.similarProduct?.image ?? Utils.dummyProductImage,
                    height: 120.height,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),

                // Image.asset(
                //   Utils.getAssetPNGPath("offer_meat"),
                //   height: 116.height,
                //   width: 136.width,
                // ),
                SizedBox(height: 6.height),
                AppText(
                  title: widget.similarProduct?.category ?? "test",
                  fontSize: 14,
                ),
                SizedBox(height: 6.height),
                AppText(
                  title: widget.similarProduct?.name ?? "test",
                  maxLines: 1,
                  fontSize: 14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 6.height),
                Row(
                  children: [
                    Row(
                      children: [
                        AppText(
                          title: widget.similarProduct?.price ?? "test",
                          fontSize: 14,
                          color: AppColors.lightGray,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough,
                        ),
                        SizedBox(width: 4.width),
                        AppText(
                          title: widget.similarProduct?.offerPrice ?? "test",
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        RouteUtils.navigateTo(const CartView());
                      },
                      child: Image.asset(
                        Utils.getAssetPNGPath("shopping_icon"),
                        width: 22.width,
                        height: 22.height,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              left: Utils.isAR ? 6 : null,
              right: Utils.isAR ? null : 6,
              top: 6,
              child: Container(
                height: 35.height,
                width: 35.height,
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  children: [
                    AppText(
                      title: widget.similarProduct?.discount ?? "test",
                      fontSize: 8,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    AppText(
                      title: "a_discount".tr(),
                      fontSize: 8,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: Utils.isAR ? null : -6,
              right: Utils.isAR ? -6 : null,
              top: -6,
              child: IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primary,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;
                    FavouriteBloc.of(context).add(
                      Click(
                        arguments: {
                          "product_id": widget.similarProduct?.id,
                          "like": _isFavorite,
                        },
                      ),
                    );

                    // if (widget.onFavoriteChanged != null) {
                    //   widget.onFavoriteChanged!(_isFavorite);
                    // }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
