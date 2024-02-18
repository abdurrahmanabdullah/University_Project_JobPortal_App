import 'dart:convert';

import 'package:ecommerce/core/models/profile.dart';
import 'package:http/http.dart' as http;

class Profile {
  var apiurl = 'http://192.168.60.35:1330/api/user-registrations';
  Future<ProfileModel> getProfile() async {
    http.Response response;
    response = await http.get(Uri.parse(apiurl));

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      ProfileModel getProfile = ProfileModel.fromJson(responseData);
      print(getProfile.toJson());
      return getProfile;
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
