import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:window_manager/window_manager.dart';
import 'package:system_theme/system_theme.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

import './screens/home.dart';
import './screens/unsupported.dart';

bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!isWindows) {
    runApp(const UnsupportedApp());
  } else {
    await WindowManager.instance.ensureInitialized();
    await SystemTheme.accentColor.load();
    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        // TitleBarStyle.hidden,
        TitleBarStyle.normal,
      );
      await windowManager.setSize(const Size(800, 600));
      await windowManager.setTitle('ints pdf viewer');
      await windowManager.setBackgroundColor(Colors.transparent);
      await windowManager.center();
      await windowManager.show();
      // await windowManager.setPreventClose(true);
      await windowManager.focus();
      await windowManager.setMovable(true);
    });
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'ints',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(),
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
