import 'package:rent_ready_app/core/language/GlobalTranslations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeDialog extends StatefulWidget {
  @override
  _ThemeDialogState createState() => _ThemeDialogState();
}

class _ThemeDialogState extends State<ThemeDialog> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(allTranslations.text("")),
      children: <Widget>[
        Container(
        )
      ],
    );
    ;
  }
}
