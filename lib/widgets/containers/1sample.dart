import 'package:fluent_ui/fluent_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:google_search_suggestions/google_search_suggestions.dart';

import '../../widgets/webview.dart';

class OnesampleCont extends StatelessWidget {
  const OnesampleCont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? filepath;
    return NavigationView(
      content: Center(
        child: Stack(
          children: [
            Button(
              child: const Text('Open File'),
              onPressed: () async {
                filepath = await FilePicker.platform.pickFiles().then((value) {
                  return value!.files.single.path;
                });
                if (filepath != " ") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WVcontainer(
                        url: filepath,
                        rowcont: 2,
                        colmncount: 1,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
