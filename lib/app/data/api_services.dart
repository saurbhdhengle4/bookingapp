import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService extends GetConnect {
  ApiService() {
    baseUrl = "https://www.cgprojects.in/lens8/api/dummy/";
  }

  getData(String endpoint, {Map<String, dynamic>? query}) async {
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final response = await http.get(url);

      return response;
    } catch (e) {
      return Future.error("Exception: $e");
    }
  }
}
