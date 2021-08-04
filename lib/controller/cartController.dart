import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/DisplayCartModel.dart';

class CartListController extends GetxController {
  RxList cartItems = RxList<CartResponse>();
  var itemcount = 0.obs;

  Future<void> fetchCartItemsList() async {
    var data = await CartSectionApi().displayCart();
    if (data== null) return;
    itemcount.value = data.data.response.length;
    cartItems = data.data.response.obs;
  }
}
