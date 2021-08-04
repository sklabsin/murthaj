import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/DisplayWishlistModel.dart';
import 'package:murthaji/Model/cartModel.dart';
import 'package:murthaji/Screens/constants.dart';
import 'package:murthaji/controller/favouriteController.dart';
import 'package:murthaji/controller/spinner.dart';

class WishList extends StatefulWidget {
  const WishList({Key key}) : super(key: key);

  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  TextEditingController code = TextEditingController();
  FavoritesListController favListcontroller =
      Get.put(FavoritesListController());
  @override
  Future<void> initState() {
    // TODO: implement initState
    Future.delayed(Duration(microseconds: 5)).then((value) async {
      await favListcontroller.fetchFavoritesList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff4a4b4d),
            size: 20,
          ),
        ),
        title: Text(
          'Wishlist',
          style: TextStyle(color: Color(0xff4a4b4d), fontSize: 25),
        ),
      ),
      body: Spinner(
        child: Container(
          padding: EdgeInsets.only(top: 15),
          width: width(context),
          child: FutureBuilder<WishlistDisplayClass>(
            future: FavouriteSection().displayWishlist(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (snapshot.data.data.response.length > 0)
                    ? Obx(
                        () => ListView.builder(
                            itemCount: favListcontroller.favlist.length,
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return ProductItem(
                                data: favListcontroller.favlist[index],
                                index: index,
                              );
                            }),
                      )
                    : Center(
                        child: Text(
                          'Empty Wishlist ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  ProductItem({Key key, this.data, this.index});
  WishListResponse data;
  int index;

  @override
  Widget build(BuildContext context) {
    FavoritesListController favListcontroller =
        Get.put(FavoritesListController());
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.18,
        actions: [
          SlideAction(
            onTap: () async {
              CartModel d = (data.cartStatus == '1')
                  ? await CartSectionApi().updateCart(
                      cid: data.cartId, pid: data.productId, qty: '1')
                  : await CartSectionApi().addCart(
                      pid: data.productId,
                      qty: '1',
                    );
              if (d.data.status == '200') {
                await toastFn(comment: d.data.response);
              } else
                await toastFn(comment: 'Not Added to cart');
            },
            child: Container(
              width: 65,
              margin: EdgeInsets.only(right: 5, top: 3, bottom: 3),
              decoration: BoxDecoration(
                color: colorblue,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/shopping-cart.png',
                  fit: BoxFit.contain,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
        secondaryActions: <Widget>[
          SlideAction(
            onTap: () async {
              showSpinner();
              await FavouriteSection().removefavourite(pid: data.productId);
              favListcontroller.favlist.removeAt(index);
              await favListcontroller.fetchFavoritesList();
              hideSpinner();
            },
            child: Container(
              width: 65,
              margin: EdgeInsets.only(right: 5, top: 3, bottom: 3),
              decoration: BoxDecoration(
                color: colorblue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          )
        ],
        child: Container(
          height: 92,
          width: width(context),
          color: Color(0xfff8f8f8),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 80,
                  width: 85,
                  color: Colors.white,
                  child: (data.productImage == null)
                      ? Container(
                          width: 65,
                        )
                      : Image.network(
                          "$imgurl" + "${data.productImage.split(',')[0]}",
                          fit: BoxFit.contain,
                        ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Text(
                  EasyLocalization.of(context).currentLocale ==
                          Locale('en', 'US')
                      ? data.productName ?? ''
                      : data.productNameArab ?? "",
                  style: TextStyle(
                    color: colorblue,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'KD ' + data.productSellPrice ?? 0,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Color(0xff2682AB),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
