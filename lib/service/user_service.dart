import 'dart:convert';

import 'package:whatsapp_clone/models/users_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String url = "https://reqres.in/api/users?page=2";
  Future<UsersModel?> fetchUsers() async {
    var res = await http.get(Uri.parse(url)); //isteği attık
    if (res.statusCode == 200) {
      var jsonBody = UsersModel.fromJson(jsonDecode(res.body));
      return jsonBody;
    } else {
      print("İstek başarısız oldu=>${res.statusCode} ");
    }
  }
}
