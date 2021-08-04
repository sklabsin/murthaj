import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/DisplayWishlistModel.dart';

class FavoritesListController extends GetxController {
  RxList favlist = RxList<WishListResponse>();

  Future<void> fetchFavoritesList() async {
    var data = await FavouriteSection().displayWishlist();
    if (data.data == null) return;
    favlist = data.data.response.obs;
  }
}
