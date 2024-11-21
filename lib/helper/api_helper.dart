
import 'dart:convert';

import 'package:http/http.dart 'as http;
import 'package:http/http.dart';
class Api_Helper
{
  Api_Helper._();
  static Api_Helper api_helper=Api_Helper._();
  Future<Map> fectdata()
  async {
    final api="https://pixabay.com/api/?key=47207418-8c61497e025cd9d1c57cb5533&q";
    Uri uri=Uri.parse(api);
    Response response=await http.get(uri);
    if(response.statusCode==200)
      {
        String data=response.body;
        Map json=jsonDecode(data);
        return json;
      }
    return {};
  }
}