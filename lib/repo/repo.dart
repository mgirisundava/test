import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/data_model.dart';

class Repo {
  Future getData() async {
    http.Response response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    print(response.statusCode);
    if (response.statusCode != 200) {
      print("TIDAK DAPAT DATA DARI SERVER");
      return null;
    } else {
      Iterable resp = (json.decode(response.body)['data']);
      List<DataModel?> data = resp.map((e) => DataModel.fromJson(e)).toList();

      return data;
    }
  }
}
