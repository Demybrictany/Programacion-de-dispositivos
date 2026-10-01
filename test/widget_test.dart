import 'package:flutter_test/flutter_test.dart';

import 'package:inkash/app.dart';

void main() {
  testWidgets('muestra el resumen financiero de inicio', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const InkashApp());

    expect(find.text('Hola, Kevin'), findsOneWidget);
    expect(find.text('Q2,796.50'), findsOneWidget);
    expect(find.text('Últimos movimientos'), findsOneWidget);
    expect(find.text('Uber al trabajo'), findsOneWidget);
  });
}
