import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:master_flutter/app/app.dart';

void main() {
  group("Calculator View Test", () {
    testWidgets('Calculator Basic Test', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      expect(find.byKey(const Key("Result")), findsOneWidget);
      expect(find.byKey(const Key("displayOne")), findsOneWidget);
      expect(find.byKey(const Key("displayTwo")), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.add), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);

      //  final d1 = find.byKey(Key('displayOne'));
      //  final d2 = find.byKey(Key('displayTwo'));
      //  print(d1);

      // await tester.pumpWidget(MyApp());
      // expect(find.byType(Container), findsOneWidget);
      // expect(find.byType(Center), findsOneWidget);
      // expect(find.text('Hello world'), findsOneWidget);
    });

    testWidgets("Operation Test", (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.enterText(find.byKey(const Key("displayOne")), "30");
      await tester.enterText(find.byKey(const Key("displayTwo")), "15");

      await tester.tap(find.byIcon(CupertinoIcons.add));

      await tester.pump();

      expect(find.text("45"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.minus));

      await tester.pump();

      expect(find.text("15"), findsNWidgets(2));

      await tester.tap(find.byIcon(CupertinoIcons.multiply));

      await tester.pump();

      expect(find.text("450"), findsOneWidget);

      await tester.tap(find.byIcon(CupertinoIcons.divide));

      await tester.pump();

      expect(find.text("2.0"), findsOneWidget);
    });
  });
}
