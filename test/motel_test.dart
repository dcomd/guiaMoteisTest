

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:guia_de_moteis/main.dart';
import 'package:guia_de_moteis/providers/motel_provider.dart';

void main() {
  test('Verifica se o motelProvider retorna dados corretamente', () async {
    final container = ProviderContainer();
  
    final motelState = container.read(motelProvider);
    expect(motelState, isNotNull);
  });

  testWidgets('Exibe lista de motéis', (WidgetTester tester) async {
  // Build your widget tree
  await tester.pumpWidget(MyApp());

  // Verify that a widget appears on the screen
  expect(find.byType(ListView), findsOneWidget);
  expect(find.text('Motéis Disponíveis'), findsOneWidget);
});

}
