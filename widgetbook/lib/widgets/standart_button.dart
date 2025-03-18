import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:flutter_sandbox_app/widgets/standard_button.dart';

@UseCase(name: 'Primary', type: StandardButton)
Widget primaryButton(BuildContext context) {
  return StandardButton(
    text: 'Primary',
    state: ButtonState.primary,
  );
}

@UseCase(name: 'Secondary', type: StandardButton)
Widget secondaryButton(BuildContext context) {
  return StandardButton(
    text: 'Secondary',
    state: ButtonState.secondary,
  );
}

@UseCase(name: 'Disabled', type: StandardButton)
Widget disabledButton(BuildContext context) {
  return StandardButton(
    text: 'Disabled',
    state: ButtonState.disabled,
  );
}