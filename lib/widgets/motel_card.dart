import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/motel.dart'; // Supondo que você tenha o modelo de Motel

class MotelCard extends StatelessWidget {
  final Motel motel;

  const MotelCard({Key? key, required this.motel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var suite in motel.suites)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 250.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(suite.fotos.isNotEmpty ? suite.fotos[0] : motel.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  suite.nome.replaceAll('SuÃ­te', '').trim(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var periodo in suite.periodos)
                        PeriodoWidget(periodo: periodo),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class PeriodoWidget extends StatelessWidget {
  final Periodo periodo;

  const PeriodoWidget({Key? key, required this.periodo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        '${periodo.tempoFormatado} - R\$ ${periodo.valorTotal.toStringAsFixed(2)}',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}

class MotelListScreen extends StatelessWidget {
  final List<Motel> motels = []; // Aqui você pode substituir pela lógica de provider ou API

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motéis Disponíveis'),
      ),
      body: ListView.builder(
        itemCount: motels.length,
        itemBuilder: (context, index) {
          final motel = motels[index];
          return MotelCard(motel: motel);
        },
      ),
    );
  }
}
