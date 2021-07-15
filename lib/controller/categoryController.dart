import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/CategoryPage/subCategoryClass.dart';

class CategoryController extends GetxController {
  var selectedindex = 0.obs;
  RxString selectedIndexCId = RxString('');
  RxList<Prod> prodlist = RxList<Prod>();
  Future<void> fetchproducts() async {
    var products = await CategoryApi().subCategory(id: '25');
  }
}
