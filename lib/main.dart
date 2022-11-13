import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';
import 'package:system_theme/system_theme.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

import './screens/unsupported.dart';

bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!isWindows) {
    runApp(const UnsupportedApp());
  } else {
    await WindowManager.instance.ensureInitialized();
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      title: 'Flutter Demo',
      // theme: FluentThemeData.Dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        displayMode: PaneDisplayMode.compact,
      ),
    );
  }
}

class UnsupportedApp extends StatelessWidget {
  const UnsupportedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      title: 'ints PDF VIEWER',
      home: UnSupported(),
    );
  }
}
