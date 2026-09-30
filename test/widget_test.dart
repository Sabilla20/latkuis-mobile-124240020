import 'package:flutter_test/flutter_test.dart';
import 'package:latkuis_124240020/main.dart';

void main() {
  testWidgets('Login kosong menampilkan pesan validasi', (tester) async {
    await tester.pumpWidget(const GacoanApp());
    await tester.tap(find.text('Login'));
    await tester.pump();
    expect(find.text('Username tidak boleh kosong'), findsOneWidget);
    expect(find.text('Password tidak boleh kosong'), findsOneWidget);
  });
}
