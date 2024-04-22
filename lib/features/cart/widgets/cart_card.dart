import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:harri_farm_app/features/cart/models/cart_model.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class CartCard extends StatefulWidget {
  final Cart cart;
  final void Function() onIncrement;
  final void Function() onDecrement;
  final VoidCallback onDelete;

  const CartCard({
    Key? key,
    required this.cart,
    required this.onIncrement,
    required this.onDecrement,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 130.height,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                widget.cart.image ?? Utils.dummyProductImage,
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
                    Row(
                      children: [
                        Expanded(
                          child: AppText(
                            title: widget.cart.name ?? "dummy",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: InkWell(
                            onTap: widget.onDelete,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.height),
                    AppText(
                      title: widget.cart.description ?? "dummy",
                      maxLines: 1,
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
                              AppText(
                                title: widget.cart.price ?? "dummy",
                                color: AppColors.black,
                                maxLines: 1,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: widget.onDecrement,
                          child: const Icon(
                            FontAwesomeIcons.circleMinus,
                            color: AppColors.green,
                          ),
                        ),
                        SizedBox(width: 10.width),
                        AppText(
                          title: '${widget.cart.quantity}',
                          fontSize: 16,
                          color: AppColors.black,
                        ),
                        SizedBox(width: 10.width),
                        InkWell(
                          onTap: widget.onIncrement,
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
