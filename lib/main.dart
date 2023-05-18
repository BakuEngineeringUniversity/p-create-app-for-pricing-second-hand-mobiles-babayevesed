import 'package:telefonchu/app/app.dart';
import 'package:telefonchu/bootstrap.dart';
import 'app/app_view.dart';

Future<void> main() async {
  final app = App();
  await app.init();
  bootstrap(() => const AppView());
}
