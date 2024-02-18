import 'dart:convert';

import 'package:ecommerce/core/models/productModel.dart';
import 'package:http/http.dart' as http;

class GetAPI {
  var apiurl = 'http://192.168.60.35:1330/api/products';
  Future<ProductModel> getApi() async {
    http.Response response;
    response = await http.get(Uri.parse(apiurl));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      ProductModel getmodel = ProductModel.fromJson(responseData);
      print(getmodel.toJson());
      return getmodel;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
