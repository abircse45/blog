import 'dart:convert';
import 'package:blog/api/api.dart';
import 'package:blog/model/category_subcategory.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  Gagro _gagro = Gagro();
  List<DataList> datalist = List();
  DataProvider() {
    _gagro.data.dataList = datalist;
  }

  setData(Gagro fff) {
    _gagro = fff;
    notifyListeners();
  }

  Gagro getData() {
    return _gagro;
  }

  Future<Gagro> fetchApi() async {
    http.Response response = await http.get(BaseURL.CATEGORY_DATA);

    if (response.statusCode == 200) {
      var jsonData = Gagro.fromJson(jsonDecode(response.body));
      return jsonData;
    }
  }
}
