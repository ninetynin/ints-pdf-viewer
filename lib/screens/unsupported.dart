import 'package:fluent_ui/fluent_ui.dart';

class UnSupported extends StatelessWidget {
  const UnSupported({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NavigationView(
      content: Center(
        child: Text('This platform is not supported'),
      ),
    );
  }
}
