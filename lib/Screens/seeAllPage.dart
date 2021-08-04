import 'package:flutter/material.dart';
import 'package:murthaji/Model/HomePage/mostPopularModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/extras/screenSizes.dart';
import 'TabBarScreens.dart/homePage.dart';

class SeeAllPage extends StatefulWidget {
  SeeAllPage({Key key, this.data, this.txt});
  MostPopularClass data;
  String txt;

  @override
  _SeeAllPageState createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorblue,
        title: Text(widget.txt),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 17, right: 17, top: 20),
        child: GridView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.data.data.response.length,
          // itemCount: 6,
          physics: AlwaysScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            crossAxisCount: 2,
            childAspectRatio: ScreenSize.gridRatio(context),
          ),
          itemBuilder: (context, int index) {
            return CardWidget(
              data: widget.data.data.response[index],
            );
          },
        ),
      ),
    );
  }
}
