import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/review_entity.dart';
import '../../../../../core/utils/functions/format_time.dart';
import '../../../../../core/utils/text_styles.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key, required this.reviewEntity});

  final ReviewEntity reviewEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            children: [
              SizedBox(
                height: 50.67,
                width: 56.52,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 30,
                      backgroundImage: NetworkImage(reviewEntity.image),
                    ),
                    Positioned(
                      bottom: 5,
                      right: -5,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Color(0xffFFC529),
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(255, 197, 41, 0.5),
                              // rgba(255, 197, 41, 0.5)
                              blurRadius: 13.67,
                              offset: Offset(0, 6.84),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            reviewEntity.rating.toDouble().toString(),
                            style: TextStyles.textStyle11SemiBold.copyWith(
                              color: Colors.white,
                              height: 140 / 100,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 11.0),
                    child: Text(
                      reviewEntity.name,
                      style: TextStyles.textStyle16SemiBold.copyWith(
                        height: 140 / 100,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    formatTime(reviewEntity.date),
                    style: TextStyles.textStyle13Regular
                        .copyWith(color: Color(0xff949D9E), height: 160 / 100),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 17),
        Text(
          reviewEntity.comment,
          textAlign: TextAlign.start,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyles.textStyle13Regular.copyWith(
            color: Color(0xff949D9E),
            height: 160 / 100,
          ),
        ),
      ],
    );
  }
}
