import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/cart/bloc/cart_bloc.dart';
import 'package:harri_farm_app/features/cart/models/cart_model.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_card.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class CartProudcts extends StatelessWidget {
  final CartModel cartModel;
  const CartProudcts({
    super.key,
    required this.cartModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: cartModel.data?.carts?.length ?? 0,
          shrinkWrap: true,
          reverse: true,
          itemBuilder: (context, index) {
            return CartCard(
              onDecrement: () {
                CartBloc.of(context)
                    .add(Click(arguments: cartModel.data?.carts?[index].id));
              },
              onIncrement: () {
                CartBloc.of(context)
                    .add(Add(arguments: cartModel.data?.carts?[index].id));
              },
              onDelete: () {
                CartBloc.of(context)
                    .add(Clear(arguments: cartModel.data?.carts?[index].id));
              },
              cart: cartModel.data?.carts?[index] ?? Cart(),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.height);
          },
        ),
      ],
    );
  }
}
