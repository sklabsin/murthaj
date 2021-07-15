import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:murthaji/Api/api.dart';

class LikeSection extends StatelessWidget {
  LikeSection({
    Key key,
    this.pid,
    this.wishlistStatus,
  }) : super(key: key);

  String pid;
  String wishlistStatus;

  @override
  Widget build(BuildContext context) {
    Future<bool> onLikeButtonTapped(bool isLiked) async {
      isLiked == false
          ? FavouriteSection().addfavourite(pid: pid)
          : FavouriteSection().removefavourite(pid: pid);
      return !isLiked;
    }

    return Container(
      width: 35,
      height: 40,
      child: LikeButton(
        size: 24,
        circleColor: CircleColor(
          start: Color(0xff1C477A),
          end: Color(0xff1C477A),
        ),
        bubblesColor: BubblesColor(
          dotPrimaryColor: Colors.red,
          dotSecondaryColor: Colors.red,
        ),
        onTap: onLikeButtonTapped,
        isLiked: wishlistStatus == '0' ? false : true,
        likeBuilder: (bool isLiked) {
          return Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Color(0xff1C477A),
            size: 24,
          );
        },
      ),
    );
  }
}
