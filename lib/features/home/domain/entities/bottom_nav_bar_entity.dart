import '../../../../generated/assets.dart';

class BottomNavBarEntity {
  final int index;
  final String title;
  final String activeIcon;
  final String inActiveIcon;

  BottomNavBarEntity({
    required this.index,
    required this.title,
    required this.activeIcon,
    required this.inActiveIcon,
  });
}

List<BottomNavBarEntity> get bottomNavBarList => [
      BottomNavBarEntity(
        index: 0,
        title: 'الرئيسية',
        activeIcon: Assets.boldHomeBold,
        inActiveIcon: Assets.outlinedHomeOutlined,
      ),
      BottomNavBarEntity(
        index: 1,
        title: 'المنتجات',
        activeIcon: Assets.boldCategoriesBold,
        inActiveIcon: Assets.outlinedCategoriesOutlined,
      ),
      BottomNavBarEntity(
        index: 2,
        title: 'سلة التسوق',
        activeIcon: Assets.boldShoppingCartBold,
        inActiveIcon: Assets.outlinedShoppingCartOutlined,
      ),
      BottomNavBarEntity(
        index: 3,
        title: 'حسابي',
        activeIcon: Assets.boldUserBold,
        inActiveIcon: Assets.outlinedUserOutlined,
      ),
    ];
