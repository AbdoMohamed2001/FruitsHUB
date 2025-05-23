import 'package:flutter/material.dart';
import 'package:fruits_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:fruits_app/generated/assets.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: pageController,
        children: [
          PageViewItem(
            isVisible: true,
            image: Assets.imagesFruitbasket,
            bgImage: Assets.imagesFirstPageBG,
            subtitle:
                'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  'مرحبًا بك في',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'HUB ',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: Color(0xffF4A91F),
                  ),
                ),
                Text(
                  'Fruit',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                    color: Color(0xff1B5E37),
                  ),
                ),
              ],
            ),
          ),
          PageViewItem(
            isVisible: false,
            image: Assets.imagesPineapple,
            bgImage: Assets.imagesFirstPageBG,
            subtitle:
                'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية ا',
            title: Text(
              'ابحث وتسوق',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
