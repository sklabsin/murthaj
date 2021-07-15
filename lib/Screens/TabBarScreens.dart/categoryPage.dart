import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/CategoryPage/MainCategoryModel.dart';
import 'package:murthaji/Model/CategoryPage/subCategoryClass.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:get/get.dart';
import 'package:murthaji/controller/categoryController.dart';
import 'package:murthaji/extras/likeButton.dart';
import 'package:murthaji/extras/screenSizes.dart';
import '../single_product.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: <Widget>[
            FutureBuilder<MainCategoryModel>(
              future: CategoryApi().mainCategory(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return LeftWidget(
                    data: snapshot.data,
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              },
            ),
            Expanded(
              child: FutureBuilder<SubCategoryClass>(
                future: CategoryApi().subCategory(id: '25'),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return RightWidget(
                      data: snapshot.data,
                    );
                  } else
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeftWidget extends StatefulWidget {
  LeftWidget({this.data});
  MainCategoryModel data = MainCategoryModel();
  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> {
  // List<String> list = [
  //   "My profile",
  //   "Notifcation",
  //   "Invoice",
  //   "Home",
  //   "My profile",
  //   "Notifcation",
  //   "Invoice",
  //   "Home"
  // ];

  CategoryController controller = Get.put(CategoryController());

  // int checkIndex = 0;

  @override
  void initState() {
    // checkIndex = widget.data!.data!.response!.length - 1;

    super.initState();
    SchedulerBinding.instance.endOfFrame.then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Column(
          children: [
            Spacer(),
            Container(
              width: 55,
              height: MediaQuery.of(context).size.height - 190,
              padding: EdgeInsets.only(top: 30, bottom: 30),
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                color: colorblue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(90),
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Obx(
                  () => Column(
                    children: [
                      for (int i = 0; i < widget.data.data.response.length; i++)
                        Column(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.selectedindex.value = i;
                                controller.selectedIndexCId.value =
                                    widget.data.data.response[i].categoryId;
                                print(controller.selectedIndexCId.value);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: (controller.selectedindex.value == i)
                                      ? Colors.white.withOpacity(.8)
                                      : Colors.transparent,
                                ),
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Text(
                                    widget.data.data.response[i].categoryLabel
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          (controller.selectedindex.value == i)
                                              ? colorblue
                                              : Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RightWidget extends StatefulWidget {
  RightWidget({this.data});
  SubCategoryClass data = SubCategoryClass();
  @override
  _RightWidgetState createState() => _RightWidgetState();
}

class _RightWidgetState extends State<RightWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 15,
      ),
      child: DefaultTabController(
        length: widget.data.data.response[0].subcat.length,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "Category",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: SizedBox(
                height: 30,
                child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.black,
                  labelColor: Color(0xff365EFF),
                  labelStyle: TextStyle(fontSize: 12),
                  indicator: BoxDecoration(
                    color: Color(0xffEDF0FF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  tabs: <Widget>[
                    for (int i = 0;
                        i < widget.data.data.response[0].subcat.length;
                        i++)
                      Tab(
                        text: widget
                            .data.data.response[0].subcat[i].subcategoryName,
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  for (int i = 0;
                      i < widget.data.data.response[0].subcat.length;
                      i++)
                    RightBody(
                      prod: widget.data.data.response[0].subcat[i].prod,
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RightBody extends StatelessWidget {
  RightBody({this.prod});
  List<Prod> prod;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 4, top: 10, bottom: 25),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: prod.length,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 7,
                mainAxisSpacing: 7,
                crossAxisCount: 3,
                childAspectRatio: ScreenSize.gridRatio(context) * 2.3,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SingleProduct(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                              color: Color(0x33757575).withOpacity(.2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: "$imgurl" +
                                      "${prod[index].productImage.split(',')[0]}",
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                // Image.network(
                                //   "$imgurl" +
                                //       "${prod![index].productImage!.split(',')[0]}",
                                // fit: BoxFit.fill,
                                //   width: (width(context) - 90) / 2,),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  prod[index].productName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "KD " + prod[index].productSellPrice,
                                  style: TextStyle(
                                    color: Color(0xff4a4b4d),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: LikeSection(
                        pid: prod[index].productId,
                        wishlistStatus: prod[index].wishlist_status,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
