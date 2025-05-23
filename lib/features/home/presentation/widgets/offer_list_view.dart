import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/domain/entities/offer_cart_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/offer_card.dart';

import '../../../../core/utils/constants.dart';

class OfferListView extends StatelessWidget {
  const OfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getDummyOffersCart().length,
        itemBuilder: (_, index) => OfferCard(
          offerCartEntity: getDummyOffersCart()[index],
        ),
      ),
    );
  }
}
