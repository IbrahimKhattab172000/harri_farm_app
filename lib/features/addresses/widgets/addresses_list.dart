import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/addresses/widgets/addresses_card.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class AddressesList extends StatelessWidget {
  const AddressesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemBuilder: (context, index) {
        return const AddressesCard();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.height);
      },
    );
  }
}
