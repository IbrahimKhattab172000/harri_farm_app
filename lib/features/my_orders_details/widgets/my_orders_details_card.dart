import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders_details/models/my_orders_details_model.dart';

import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrdersDetailsCard extends StatelessWidget {
  final Offers offer;
  const MyOrdersDetailsCard({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                Utils.getAssetPNGPath("cart_item"),
                width: 94.width,
                height: 94.height,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: offer.name ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.darkGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 4.height),
                AppText(
                  title: offer.quantity.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.gray,
                  fontSize: 12,
                ),
                SizedBox(height: 4.height),
                Row(
                  children: [
                    const AppText(
                      title: 'SR',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.gray,
                      fontSize: 12,
                    ),
                    SizedBox(width: 4.width),
                    AppText(
                      title: offer.price.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.gray,
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
