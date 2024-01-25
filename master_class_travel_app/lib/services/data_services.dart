import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:master_class_travel_app/model/data_model.dart';

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        List<DataModel> newList =
            list.map((item) => DataModel.fromJson(item)).toList();
        return newList;
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print("Error on getInfo: $e");
      return <DataModel>[];
    }
  }
}
