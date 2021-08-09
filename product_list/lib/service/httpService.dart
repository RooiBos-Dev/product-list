import 'dart:convert';

import 'package:product_list/constants.dart';
import 'package:product_list/model/exception/generalException.dart';
import 'package:product_list/model/right/user.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static const HttpService instance = HttpService();

  const HttpService();

  Future<User> login(String? username, String? password) async {
    final result = await http.post(
      Uri.parse('http://kazang-test.getsandbox.com/users/login'),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Access-Control-Allow-Origon": "*",
        "Access-Control-Allow-Headers": "Content-Type",
        "Access-Control-Allow_Methods": "GET,POST,PUT,DELETE,PATCH,OPTIONS",
        "Acess-Control-Allow-Credentials": "true",
      },
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (result.statusCode == 200) {
      final json = jsonDecode(result.body);
      final user = User.fromJson(json);

      return user;
    } else {
      final json = jsonDecode(result.body);
      throw Exception('${json['statusCode']}: ${json['title']}');
    }
  }

  Future<User> register(String? username, String? password) async {
    final result = await http.post(
      Uri(
        path: '/users',
        scheme: Constants.APISCHEMA,
        host: Constants.APIHOST,
      ),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/json',
      },
      body: jsonEncode({'username': username, 'password': password}),
    );

    if (result.statusCode == 200) {
      final json = jsonDecode(result.body);
      final user = User.fromJson(json);

      return user;
    } else {
      final json = jsonDecode(result.body);
      throw GeneralException(
          message: '${json['statusCode']}: ${json['title']}');
    }
  }
}
