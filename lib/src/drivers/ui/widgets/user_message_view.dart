import 'package:flutter/material.dart';
import 'package:sylvinho/src/drivers/ui/widgets/message_view.dart';

class UserMessageView extends MessageView {
  const UserMessageView({
    super.key,
    required super.message,
    super.alignment = Alignment.centerRight,
  });

  @override
  Color backgroundColor(BuildContext context) => Theme.of(context).colorScheme.secondaryContainer;

  @override
  TextStyle? messageStyle(TextStyle? from) => from?.copyWith(
      color: Colors.white,
    );

  @override
  BorderRadiusGeometry borderRadius(double radius) {
    final r = Radius.circular(radius);

    return BorderRadius.only(
      topLeft: r,
      bottomLeft: r,
      topRight: r,
    );
  }
}
