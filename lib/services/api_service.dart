import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/motel.dart';

class ApiService {
  static const String baseUrl = 'https://www.jsonkeeper.com/b/1IXK';

  Future<List<Motel>> fetchMoteis() async {
    final response = await http.get(Uri.parse(baseUrl));

    // Verifique o status da resposta e o corpo
    if (response.statusCode == 200) {
      print("Resposta da API: ${response.body}");  // Log do corpo da resposta

      final data = json.decode(response.body)['data']['moteis'];
      return (data as List).map((motelJson) => Motel.fromJson(motelJson)).toList();
    } else {
      print("Erro: ${response.statusCode}");  // Log de erro de resposta
      throw Exception('Falha ao carregar dados');
    }
  }
}
