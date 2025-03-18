import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:shared_design/shared_design.dart';

@UseCase(name: 'Primary', type: ContentCard, designLink: "https://www.figma.com/design/BjmdidlW8EBIJ3jasncm6Y/test_card?node-id=1-5&t=nGc5D38owAJiNVnX-4")
Widget buildContentCard(BuildContext context) {
  return ContentCard(
    headline: 'Welcome',
    subhead: 'to the App',
    title: 'Content Card Example',
    subtitle: 'Interactive Demo',
    content: 'This is a sample content card that demonstrates the shared design system components.',
    assetPath: "assets/images/sample_image.png",
  );
}
