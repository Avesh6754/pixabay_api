import 'package:flutter/cupertino.dart';
import 'package:pixabay_api/helper/api_helper.dart';
import 'package:pixabay_api/modal/pixabaymodal.dart';

class HomeProvider extends ChangeNotifier {
  Pixabay? pixabay;

  Future<void> fetchPhotodata() async {
    Map json= await Api_Helper.api_helper.fectdata();
    pixabay=Pixabay.fromJson(json);
    notifyListeners();

  }
  HomeProvider()
  {
    fetchPhotodata();
  }
}
