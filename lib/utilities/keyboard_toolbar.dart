import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:rent_ready_app/resources/strings_generated.dart';

///
/// ***   How to use it  ***
/// you need to provide focusNode for the edit text
/// KeyboardActions is a Widget
///  KeyboardActions(
///     config: keyboardToolBarDone(context, focusNode),
///      child: anyWidget);
///

KeyboardActionsConfig keyboardToolBarDone(
    BuildContext context, List<FocusNode> focusNodes) {
  return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: kIsWeb?[]:focusNodes
          .map((element) =>
          KeyboardActionsItem(focusNode: element, toolbarButtons: [
                (node) {
              return GestureDetector(
                onTap: () => node.unfocus(),
                child: Container(
                  color: Colors.grey[200],
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                   AppStrings.done,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              );
            }
          ]))
          .toList());
}
