import 'package:get/get.dart';
import 'package:murthaji/Api/api.dart';

class CityAndGover extends GetxController {
  var goverList = RxList<String>().obs;
  var cityList = RxList<String>().obs;
  var selectedGovern = ''.obs;
  var selectedCity = ''.obs;

  Future<void> fetchGover() async {
    goverList.value.clear();
    var data = await AddressApis().getGovernarate();
    for (int i = 0; i < data.data.response.length; i++) {
      goverList.value.add(data.data.response[i].governorate);
    }
    selectedGovern.value = goverList.value[0];
  }

  Future<void> fetchCity({String gov}) async {
    var data = await AddressApis().getCities(gov);
    for (int i = 0; i < data.data.response.length; i++) {
      cityList.value.add(data.data.response[i].cityName);
    }
  }
}
