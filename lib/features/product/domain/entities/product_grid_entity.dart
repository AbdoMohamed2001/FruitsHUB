import 'package:fruits_app/core/entities/product_entity.dart';

import '../../../../generated/assets.dart';

class ProductGridEntity {
  final String image;
  final String title;
  final String subTitle;

  ProductGridEntity(
      {required this.image, required this.title, required this.subTitle});

  static List<ProductGridEntity> getProductGridList(
      ProductEntity productEntity) {
    return [
      ProductGridEntity(
        image: Assets.imagesCalendar,
        title: '${productEntity.expMonths} شهر ',
        subTitle: 'الصلاحيه',
      ),
      ProductGridEntity(
        image: Assets.imagesLotus,
        title: productEntity.isOrganic ? '100%' : 'مصنعة',
        subTitle: productEntity.isOrganic ? 'اورجانيك' : 'صناعيٌّ ',
      ),
      ProductGridEntity(
        image: Assets.imagesCalories,
        title: '${productEntity.noOfCalories} كالوري ',
        subTitle: '${productEntity.noOfGrams} جرام ',
      ),
      ProductGridEntity(
        image: Assets.imagesFavourites,
        title: productEntity.avgRating.toStringAsFixed(2).toString(),
        subTitle: 'التقييم ',
      ),
    ];
  }
}
