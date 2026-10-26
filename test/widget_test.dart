import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_poo/main.dart';

void main() {
  testWidgets('La app carga', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(title: 'prueba de aplicacion'));
    expect(find.text('valen_g'), findsOneWidget);
  });
}