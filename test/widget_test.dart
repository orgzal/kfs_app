import 'package:flutter_test/flutter_test.dart';

import 'package:kfs_governorate_app/app.dart';

void main() {
  testWidgets('App boots with splash route', (WidgetTester tester) async {
    await tester.pumpWidget(const KfsGovernorateApp());
    await tester.pumpAndSettle();

    expect(find.text('Splash'), findsOneWidget);
  });
}
