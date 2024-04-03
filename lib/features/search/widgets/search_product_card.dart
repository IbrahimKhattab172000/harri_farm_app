import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harri_farm_app/features/cart/view/view.dart';
import 'package:harri_farm_app/features/search/models/search_model.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class SearchProductCard extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  final Function(bool)? onFavoriteChanged;
  final SearchItem searchItem;
  const SearchProductCard({
    Key? key,
    required this.onTap,
    this.isFavorite = false,
    this.onFavoriteChanged,
    required this.searchItem,
  }) : super(key: key);

  @override
  State<SearchProductCard> createState() => _AppProductCardState();
}

class _AppProductCardState extends State<SearchProductCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        // constraints: BoxConstraints(minHeight: 220.height),
        width: 146.width,
        color: AppColors.background,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 34,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        widget.searchItem.image,
                        // height: 106.height,
                        // width: 146.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 6.height),
                  AppText(
                    title: widget.searchItem.category.tr(),
                    fontSize: 14,
                  ),
                  SizedBox(height: 6.height),
                  AppText(
                    title: widget.searchItem.name.tr(),
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
                            title: widget.searchItem.price.tr(),
                            fontSize: 14,
                            color: AppColors.lightGray,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                          ),
                          SizedBox(width: 4.width),
                          AppText(
                            title: widget.searchItem.offerPrice.tr(),
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
            ),
            Positioned(
              left: Utils.isAR ? 0 : null,
              right: Utils.isAR ? null : 0,
              top: 0,
              child: Container(
                height: 35.height,
                width: 35.height,
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
                child: const Column(
                  children: [
                    AppText(
                      title: "10%",
                      fontSize: 8,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    AppText(
                      title: "خصم",
                      fontSize: 8,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: Utils.isAR ? null : 0,
              right: Utils.isAR ? 0 : null,
              top: -10,
              child: IconButton(
                icon: Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: AppColors.primary,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    _isFavorite = !_isFavorite;

                    if (widget.onFavoriteChanged != null) {
                      widget.onFavoriteChanged!(_isFavorite);
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}