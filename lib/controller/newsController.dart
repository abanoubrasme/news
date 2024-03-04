import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news/model/newsModel.dart';

class NewsController extends GetxController {
  getData() async {
    final url = Uri.parse("http://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=74eb7d109ab04d8e872a9d7c25fc4c9b");
    http.Response response = await http.get(url);
    if(response.statusCode==200){
      try{
        return Article.fromJson(jsonDecode(response.body));
      }catch(e){
        print( " =============$e");
      }
    }
  }
}
