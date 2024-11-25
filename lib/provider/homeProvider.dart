import 'package:flutter/cupertino.dart';
import 'package:pixabay_api/helper/api_helper.dart';
import 'package:pixabay_api/modal/pixabaymodal.dart';

class HomeProvider extends ChangeNotifier {

  Pixabay? pixabay;
  Pixabay? searchpixabay;
  Future<void> fetchPhotodata() async {
    Map json= await Api_Helper.api_helper.fectdata();
    pixabay=Pixabay.fromJson(json);
    notifyListeners();
  }
  Future<void> fetchsearchPhoto(String search) async {
    Map json= await Api_Helper.api_helper.fectsearchdata(search);
    searchpixabay=Pixabay.fromJson(json);
    notifyListeners();
  }
  HomeProvider()
  {
    fetchPhotodata();
  }
}
// str = "[[0,0,0],[0,0,1],[1,1,0]]"
// strs = str.replace('[','').split('],')
// lists = [map(int, s.replace(']','').split(',')) for s in strs]