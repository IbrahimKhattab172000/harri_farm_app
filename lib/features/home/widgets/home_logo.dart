import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/home/bloc/home_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class HomeAdverts extends StatelessWidget {
  const HomeAdverts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = HomeBloc.of(context);
    return Center(
      child: Image.network(
        bloc.homeData.advert?.image ?? Utils.dummyProductImage,
        height: 92.height,
        width: 92.width,
      ),
    );
  }
}
