import 'package:flutter/material.dart';

class CategoryPages extends StatefulWidget {
  CategoryPages({Key key}) : super(key: key);

  @override
  _CategoryPagesState createState() => _CategoryPagesState();
}

class _CategoryPagesState extends State<CategoryPages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Category'),
      ),
    );
  }
}
