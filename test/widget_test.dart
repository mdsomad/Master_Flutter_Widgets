

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_flutter/app/app.dart';

void main() {
  testWidgets('Hello woeld test', (WidgetTester tester) async {

    await tester.pumpWidget(MyApp());
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(Center), findsOneWidget);
    expect(find.text('Hello world'), findsOneWidget);
  });
}
