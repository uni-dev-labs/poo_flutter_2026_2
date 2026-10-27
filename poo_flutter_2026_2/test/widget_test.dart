import 'package:flutter_test/flutter_test.dart';
import 'package:prueba_poo/main.dart';

void main() {
  testWidgets('La app arranca y muestra historias y un post',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp(title: 'prueba de aplicacion'));
    expect(find.text('Tu historia'), findsOneWidget);
    expect(find.text('camila'), findsWidgets);
  });
}
