import 'package:flutter_test/flutter_test.dart';

import 'package:malamazainabalwajeez/main.dart';

void main() {
  testWidgets('App boots and shows the scholar header', (tester) async {
    await tester.pumpWidget(const IslamicAudioApp());

    expect(
      find.text('Malama Zainab Jaafar Alwajeez'),
      findsOneWidget,
    );
  });
}