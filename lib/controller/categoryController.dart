import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';
import 'package:murthaji/Model/CategoryPage/subCategoryClass.dart';

class CategoryController extends GetxController {
  var selectedindex = 0.obs;
  var selectedCategory = ''.obs;
  var selectedSubCategoryIndex = 0.obs;

  var prodlist = RxList<Prod>();

  var subcatlist = RxList<Subcat>();

  var tabLoading = false.obs;

  Future<void> fetchproducts({String id}) async {
    tabLoading.value = true;
    var products = await CategoryApi().subCategory(id: selectedCategory.value);
    tabLoading.value = false;
    subcatlist.value = products.data.response[0].subcat;

    prodlist.value =
        products.data.response[0].subcat[selectedSubCategoryIndex.value].prod;
  }

  Future<void> fetchMainCategory() async {
    var data = await CategoryApi().mainCategory();
    selectedCategory.value = data.data.response[0].categoryId;
  }

  Future<void> fetchSubCategory() async {
    var products = await CategoryApi().subCategory(id: selectedCategory.value);
    subcatlist.value = products.data.response[0].subcat;
  }
}
