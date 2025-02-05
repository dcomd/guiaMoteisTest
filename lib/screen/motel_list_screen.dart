import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/motel_provider.dart';
import '../widgets/motel_card.dart';

class MotelListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Observa o estado do motelProvider
    final motelsAsyncValue = ref.watch(motelProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:   Text(
                  'Motéis Disponíveis',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      ),
      body: motelsAsyncValue.when(
        data: (motels) {
          if (motels.isEmpty) {
            return Center(child: Text('Nenhum motel disponível.'));
          }
          return ListView.builder(
            itemCount: motels.length,
            itemBuilder: (context, index) {
              final motel = motels[index];
              return MotelCard(motel: motel);
            },
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Erro ao carregar dados: $error')),
      ),
    );
  }
}
