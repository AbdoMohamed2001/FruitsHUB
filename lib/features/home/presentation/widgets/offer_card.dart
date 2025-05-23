import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/features/home/domain/entities/offer_cart_entity.dart';

import '../../../../generated/assets.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.offerCartEntity});
  final OfferCartEntity offerCartEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: BoxDecoration(
                color: offerCartEntity.bgColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: SizedBox(
                height: 104,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(offerCartEntity.title,
                        style: TextStyles.textStyle13Regular.copyWith(
                          color: Colors.white,
                        )),
                    Spacer(),
                    Text(
                      offerCartEntity.subTitle,
                      style: TextStyles.textStyle19Bold
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 7),
                    Container(
                      width: 116,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          'تسوق الان',
                          style: TextStyles.textStyle13Bold.copyWith(
                            color: Color(0xff1B5E37),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //image
          Expanded(
            flex: 2,
            child: Image.asset(
              Assets.imagesFrits,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
