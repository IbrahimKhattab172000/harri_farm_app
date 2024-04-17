import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/addresses/models/addresses_model.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AddressesCard extends StatelessWidget {
  final Address address;
  const AddressesCard({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 142.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.primary,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppText(
                  title: address.name ?? "محمد الحديدى",
                  fontSize: 14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
                const Spacer(),
                Image.asset(
                  Utils.getAssetPNGPath("edit"),
                  width: 20.width,
                  height: 20.height,
                ),
              ],
            ),
            SizedBox(height: 4.height),
            AppText(
              title: address.phone == null || address.phone == ""
                  ? "73366363"
                  : address.phone ?? "73763636",
              fontSize: 14,
              color: AppColors.lightGray,
            ),
            SizedBox(height: 4.height),
            AppText(
              title:
                  address.addressDetails ?? "جدة 23 شارع عبد القدوس الانصارى",
              fontSize: 14,
              color: AppColors.lightGray,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.height),
            AppText(
              title: address.country ?? "جدة 23 شارع عبد القدوس الانصارى",
              fontSize: 14,
              color: AppColors.lightGray,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
