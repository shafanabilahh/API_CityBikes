import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkService {
  final String baseUrl = 'http://api.citybik.es/v2/networks';

  Future<List<dynamic>> fetchBikeNetworks() async {
    final response = await http.get(Uri.parse(baseUrl));
    
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['networks'];
    } else {
      throw Exception('Failed to load networks');
    }
  }
}
