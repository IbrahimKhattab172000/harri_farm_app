import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/addresses/models/addresses_model.dart';
import 'package:harri_farm_app/features/addresses/widgets/addresses_card.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class AddressesList extends StatelessWidget {
  final List<Address> addresses;
  const AddressesList({
    super.key,
    required this.addresses,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: addresses.length,
      shrinkWrap: true,
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemBuilder: (context, index) {
        return AddressesCard(address: addresses[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.height);
      },
    );
  }
}
