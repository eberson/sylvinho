import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/widgets/message_view.dart';

class AssistantMessageView extends MessageView {
  const AssistantMessageView({
    super.key,
    required super.message,
  });

  @override
  Color backgroundColor(BuildContext context) {
    final theme = Theme.of(context);
    return theme.colorScheme.background;
  }

  @override
  BorderRadiusGeometry borderRadius(double radius) {
    final r = Radius.circular(radius);

    return BorderRadius.only(
      topLeft: r,
      topRight: r,
      bottomRight: r,
    );
  }
}
