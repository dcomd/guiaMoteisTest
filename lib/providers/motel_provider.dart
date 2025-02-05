import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/motel.dart';
import '../services/api_service.dart';

final motelProvider = FutureProvider<List<Motel>>((ref) async {
  final apiService = ApiService();
  return apiService.fetchMoteis();
});
