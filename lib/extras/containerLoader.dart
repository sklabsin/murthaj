import 'package:flutter/material.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:shimmer/shimmer.dart';

Shimmer containerLoading(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.white,
    highlightColor: colorblue.withOpacity(.4),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
