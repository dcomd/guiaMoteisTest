import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/services/api_service.dart';
import 'package:guia_de_moteis/models/motel.dart';

void main() {
  test('Deve carregar os motéis da API', () async {
    final apiService = ApiService();
    final motels = await apiService.fetchMoteis();
    expect(motels, isA<List<Motel>>());
  });
}
