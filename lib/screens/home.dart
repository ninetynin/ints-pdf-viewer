import 'package:fluent_ui/fluent_ui.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import '../widgets/containers/1sample.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationView(
        content: Stack(
      children: const [
        OnesampleCont(),
      ],
    ));
  }
}
