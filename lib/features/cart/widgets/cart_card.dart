import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class CartCard extends StatefulWidget {
  const CartCard({Key? key, required this.onCountChanged}) : super(key: key);

  final void Function(int count) onCountChanged;

  @override
  State<CartCard> createState() => __ProductCard();
}

class __ProductCard extends State<CartCard> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 120.height,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                Utils.getAssetPNGPath("cart_item"),
                width: 84.width,
                height: 84.height,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Expanded(
                          child: AppText(
                            title: 'فريش بيف استربس',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.height),
                    const AppText(
                      title: 'هذا النص هو مثال لنص يمكن أن يستبدل في ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.gray,
                      fontSize: 12,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const AppText(
                                title: 'LE',
                                color: AppColors.black,
                                maxLines: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              SizedBox(width: 10.width),
                              const AppText(
                                title: '150.00',
                                color: AppColors.black,
                                maxLines: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (count == 1) {
                              return;
                            }
                            count--;
                            setState(() {});
                            widget.onCountChanged(count);
                          },
                          child: const Icon(
                            FontAwesomeIcons.circleMinus,
                            color: AppColors.green,
                          ),
                        ),
                        SizedBox(width: 10.width),
                        AppText(
                          title: '$count',
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                        SizedBox(width: 10.width),
                        InkWell(
                          onTap: () {
                            if (count == 99) {
                              return;
                            }
                            count++;
                            setState(() {});
                            widget.onCountChanged(count);
                          },
                          child: const Icon(
                            FontAwesomeIcons.circlePlus,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
