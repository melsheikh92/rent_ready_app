import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rent_ready_app/features/home/presentation/DetailsScreen.dart';
import 'package:rent_ready_app/features/home/presentation/bloc/bloc.dart';
import 'package:rent_ready_app/resources/strings_generated.dart';

main() {
  testWidgets("Details screen empty state test", (WidgetTester tester) async {

    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: DetailsScreen(null),
      ),
    ));
    expect(find.text(AppStrings.accountDetailsTitle), findsOneWidget);
  });

  testWidgets("Details screen with account model test", (WidgetTester tester) async {
    String title = "Mahmoud";
    String state = "LA";
    String email = "mahmoud@mahmoud.com";
    String website = "www.mahmoud.com";
    var account = UIAccountModel.init();
    account.name = title;
    account.address1StateOrProvince = state;
    account.email = email;
    account.website = website;
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: DetailsScreen(account),
      ),
    ));
    expect(find.text(title), findsOneWidget);
    expect(find.text(state), findsOneWidget);
    expect(find.text(email), findsOneWidget);
    expect(find.text(website), findsOneWidget);
  });
}
