import 'package:http/http.dart' as http;

class LoginService {
  Future<bool> checkLogin(String email, String password) async {
    final Uri loginUrl = Uri.parse('https://reqres.in/api/login');
    final Map<String, String> requestBody = {
      "email": email,
      "password": password,
    };
    final response = await http.post(loginUrl, body: requestBody);

    return response.statusCode == 200;
  }
}
