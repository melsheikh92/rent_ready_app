import 'package:rent_ready_app/core/language/GlobalTranslations.dart';
import 'package:flutter/material.dart';

class LanguageDialog extends StatefulWidget {
  @override
  State createState() => new LanguageDialogState();
}

class LanguageDialogState extends State<LanguageDialog> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return new SimpleDialog(
        title: new Text(
          allTranslations.text(""),
        ),
        children: <Widget>[Container()]);
  }
}
