import 'package:flutter/material.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:shimmer/shimmer.dart';

Container loadingIndicatorGridView() {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 17),
    child: GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 4,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.3,
      ),
      itemBuilder: (context, int index) {
        return Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            baseColor: Colors.grey.withOpacity(.2),
            highlightColor: colorblue.withOpacity(.5),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
            ));
      },
    ),
  );
}
