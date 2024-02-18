import 'dart:convert';

import 'package:http/http.dart' as http;

class SignUp {
  Future<int?> signUnSendRequest(
    String name,
    String password,
    String email,
  ) async {
    const apiUrl = 'http://localhost:1330/api/auth/local/register';
    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(
          {
            "username": name,
            "password": password,
            "email": email,
          },
        ),
      );

      if (response.statusCode == 200) {
        print("Post request successful. Response: ${response.body}");
        // Handle the response as needed
      } else {
        print("Post request failed. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (error) {
      print("Error sending post request: $error");
    }
  }
}
