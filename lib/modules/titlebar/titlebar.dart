import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';

class GeneralWNBTNS extends StatelessWidget {
  const GeneralWNBTNS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(),
        MaximizeWindowButton(),
        CloseWindowButton(),
      ],
    );
  }
}

class WorkSpaces extends StatelessWidget {
  const WorkSpaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// TODO IN TITLEBAR:
// 1. WORKSPACES
// 2. ADD A NEW DIVISION OPTION -> ADD BUTTON
// 3. SETTINGS BUTTON
// 4. VERSION NUMBER
// 5. FOR GWNBTN ADD A BORDER TO THE BUTTONS and for workspaces add a border to the container