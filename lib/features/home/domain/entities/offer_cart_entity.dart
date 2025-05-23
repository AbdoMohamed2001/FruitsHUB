import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';

class OfferCartEntity {
  final String title;
  final String subTitle;
  final Color bgColor;
  final String fruitImage;

  OfferCartEntity({
    required this.title,
    required this.subTitle,
    required this.bgColor,
    required this.fruitImage,
  });
}

getDummyOfferCart() {
  return OfferCartEntity(
    title: "عروض العيد",
    subTitle: "خصم 25%",
    bgColor: Colors.green,
    fruitImage: Assets.imagesFrits,
  );
}

List<OfferCartEntity> getDummyOffersCart() {
  return [
    OfferCartEntity(
      title: "عروض العيد",
      subTitle: "خصم 25%",
      bgColor: Color(0xFF5DB957),
      fruitImage: Assets.imagesFrits,
    ),
    OfferCartEntity(
      title: "عروض اخر الشهر",
      subTitle: "خصم 30%",
      bgColor: Color(0xffF5B337),
      fruitImage: Assets.imagesFrits,
    ),
    OfferCartEntity(
      title: "عروض اخر الشهر",
      subTitle: "خصم 30%",
      bgColor: Colors.blueAccent,
      fruitImage: Assets.imagesFrits,
    ),
  ];
}
