
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rent_ready_app/main.dart';
import 'package:rent_ready_app/resources/assets_generated.dart';

main() {
  testWidgets('Splash Logo and progress bar Test', (tester) async {
    await tester.pumpWidget(MyApp());

    final Image image = find
        .byType(Image)
        .evaluate()
        .single
        .widget as Image;
    final AssetImage source = image.image as AssetImage;
    expect(source.assetName, AppAssets.logo.assetName);

    // Animation delay
    await Future.delayed(const Duration(seconds: 3));

    final CircularProgressIndicator progressIndicator = find
        .byType(CircularProgressIndicator)
        .evaluate()
        .single
        .widget as CircularProgressIndicator;
    expect(progressIndicator.strokeWidth, 4);
  });
}