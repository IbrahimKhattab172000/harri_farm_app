import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/product_details/bloc/product_details_bloc.dart';
import 'package:harri_farm_app/features/product_details/models/product_details_model.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class ProductDetailsInfo extends StatefulWidget {
  final ProductDetailsModel product;
  const ProductDetailsInfo({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  @override
  State<ProductDetailsInfo> createState() => _ProductDetailsInfoState();
}

class _ProductDetailsInfoState extends State<ProductDetailsInfo> {
  int itemCount = 1;

  void incrementCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementCount() {
    setState(() {
      if (itemCount > 1) {
        itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsBloc, AppState>(
      builder: (context, state) {
        final bloc = ProductDetailsBloc.of(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  widget.product.data?.offer?.image ?? Utils.dummyProductImage,
                  fit: BoxFit.fill,
                  // height: 146.height,
                  // width: 344.width,
                ),
              ),
              SizedBox(height: 16.height),

              // Product Items Count
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: widget.product.data?.offer?.category ?? "dummy",
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 8.height),
                  Row(
                    children: [
                      AppText(
                        title: widget.product.data?.offer?.name ?? "dummy",
                        maxLines: 1,
                        fontSize: 16,
                        color: AppColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          incrementCount();

                          bloc.fillBody(quantity: "$itemCount");
                        },
                        child: Container(
                          height: 32.height,
                          width: 38.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.background,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 6.width),
                      Container(
                        height: 32.height,
                        width: 42.height,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: AppText(
                            title: itemCount.toString(),
                            color: AppColors.background,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.width),
                      GestureDetector(
                        onTap: () {
                          decrementCount();
                          bloc.fillBody(quantity: "$itemCount");
                        },
                        child: Container(
                          height: 32.height,
                          width: 38.height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.background,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.remove,
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.height),

              // Product Price
              Row(
                children: [
                  AppText(
                    title: widget.product.data?.offer?.offerPrice ?? "dummy",
                    fontSize: 14,
                    color: AppColors.lightGray,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.lineThrough,
                  ),
                  SizedBox(width: 4.width),
                  AppText(
                    title: widget.product.data?.offer?.price ?? "dummy",
                    fontSize: 14,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(height: 16.height),

              // Product Type
              Row(
                children: [
                  AppText(
                    title: "${"type".tr()} : ",
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(width: 4.width),
                  AppText(
                    title: widget.product.data?.offer?.name ?? "dummy",
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(height: 16.height),

              // Product Weight
              Row(
                children: [
                  AppText(
                    title: "${"weight".tr()} : ",
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(width: 4.width),
                  AppText(
                    title:
                        " ${widget.product.data?.offer?.sizes?[0].name ?? "dummy"} ${"kilo".tr()}",
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              SizedBox(height: 16.height),

              // Product Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: "describtion".tr(),
                    fontSize: 16,
                    color: AppColors.black,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: 16.height),
                  AppText(
                    title: widget.product.data?.offer?.description ?? "dummy",
                    fontSize: 16,
                    color: AppColors.gray,
                    fontWeight: FontWeight.w500,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
