import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignIn {
  Future<int?> signInSendRequest(
    String username,
    String password,
  ) async {
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      String url = 'http://192.168.60.35:1330/api/auth/local';
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'identifier': username,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        preferences.setString('jwt', jsonDecode(response.body)['jwt']);
        preferences.setString('username', username);
        print(response.body);

        return response.statusCode;
      }

      print('Response Body is : ${response.body}');
      return response.statusCode;
    } catch (e) {
      print(e.toString());
    }
  }
}
