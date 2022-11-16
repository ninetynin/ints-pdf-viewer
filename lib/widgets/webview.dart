import 'package:fluent_ui/fluent_ui.dart';
import 'package:webview_windows/webview_windows.dart';

class WVcontainer extends StatefulWidget {
  var url;
  var rowcont, colmncount;
  WVcontainer({Key? key, this.url, this.rowcont, this.colmncount})
      : super(key: key);

  @override
  State<WVcontainer> createState() => _WVcontainerState();
}

class _WVcontainerState extends State<WVcontainer> {
  final _controller = WebviewController();
  final _textconroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    initControllerURL();
  }

  Future<void> initControllerURL() async {
    await _controller.initialize();
    await _controller.setPopupWindowPolicy(WebviewPopupWindowPolicy.sameWindow);
    _controller.url.listen((url) {
      _textconroller.text = url;
    });
    await _controller.loadUrl(widget.url);
    if (!mounted) return;
    setState(() {});
  }

  Future<WebviewPermissionDecision> _wvperms(
      String url, WebviewPermissionKind kind, bool isUserInit) async {
    final decision = await showDialog<WebviewPermissionDecision>(
        context: context,
        builder: (context) => ContentDialog(
              title: const Text('Permission Requested'),
              content: Text('$url wants to use $kind'),
              actions: [
                Button(
                    onPressed: () =>
                        Navigator.pop(context, WebviewPermissionDecision.allow),
                    child: const Text('Allow')),
                Button(
                    onPressed: () =>
                        Navigator.pop(context, WebviewPermissionDecision.deny),
                    child: const Text('Allow')),
              ],
            ));
    return decision ?? WebviewPermissionDecision.deny;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / widget.rowcont,
        width: MediaQuery.of(context).size.width / widget.colmncount,
        child: Stack(
          children: [
            Webview(
              _controller,
              permissionRequested: _wvperms,
            ),
            StreamBuilder<LoadingState>(
                stream: _controller.loadingState,
                builder: (context, snapshot) {
                  if (snapshot.hasData &&
                      snapshot.data == LoadingState.loading) {
                    return const ProgressBar();
                  } else {
                    return const SizedBox();
                  }
                })
          ],
        ));
  }
}
