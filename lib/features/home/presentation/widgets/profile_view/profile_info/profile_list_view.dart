import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/widgets/profile_view/profile_info/profile_list_view_items.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({
    super.key,
    required this.list,
    this.containsArrowIcon = true,
  });

  final List list;
  final bool containsArrowIcon;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: list.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: Color(0xffF2F3F3),
      ),
      itemBuilder: (context, index) {
        return containsArrowIcon
            ? ProfileListItemWithArrowIcon(
                image: list[index].icon,
                text: list[index].text,
                pageName: list[index].nextPageName,
              )
            : ProfileListItemWithoutArrowIcon(
                image: list[index].icon,
                text: list[index].text,
              );
      },
    );
  }
}
