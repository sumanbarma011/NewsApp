import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/api_model.dart';

class ApiCall {
  static String actualUrl = 'https://jsonplaceholder.typicode.com';
  Future<ApiModel> fetchDate() async {
    final url = '$actualUrl/albums/1';
    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    try {
      if (response.statusCode == 200) {
        print('api called');
        final responseData =
            (jsonDecode(response.body)) as Map<String, dynamic>;

        final data = ApiModel.fromJson(responseData);
        print(data.id);
        return data;
      } else {
        throw Exception();
      }
    } catch (e) {
      debugPrint('exception while fetching the data');
    }
    return ApiModel(100, 12, 'N/Q');
  }

  Future<List<ApiModel>?> fetchListData() async {
    List<ApiModel> albumList = [];
    final url = '$actualUrl/albums/';
    final Uri uri = Uri.parse(url);
    final response = await http.get(uri);
    try {
      List responseData = jsonDecode(response.body);
      albumList = responseData
          .map((e) => ApiModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return albumList;
    } catch (e) {
      print('fetch album exception');
    }
    return null;
  }
}
