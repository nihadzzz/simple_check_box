import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import '../models/remote/users_model.dart';

class UsersService {
  Future<List<Users>> fetchUsers({int page = 1}) async {
    final Uri url = Uri.parse('https://reqres.in/api/users?page=$page');
    final response = await get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final usersData = UsersModel.fromJson(data);
      return usersData.data;
    }
    throw Exception();
  }

  Future<void> deleteUser(int id) async {
    final Uri userUrl = Uri.parse('https://reqres.in/api/users/$id');
    final response = await delete(
      userUrl,
    );

    if (response.statusCode == 204) {
      log('deleted user id: $id');
    }
    throw Exception();
  }
}
