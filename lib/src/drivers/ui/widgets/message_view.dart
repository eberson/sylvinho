import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sylvinho/src/enterprise/entities/message.dart';

final _formatter = DateFormat("dd/MM/yyyy kk:mm:ss");

abstract class MessageView extends StatelessWidget {
  final Message message;
  final Alignment alignment;

  const MessageView({
    super.key,
    required this.message,
    this.alignment = Alignment.centerLeft,
  });

  BorderRadiusGeometry borderRadius(double radius);

  Color backgroundColor(BuildContext context);

  TextStyle? messageStyle(TextStyle? from) => from;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6, top: 6),
      alignment: alignment,
      width: double.maxFinite,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final theme = Theme.of(context);
          final width = constraints.maxWidth * 0.75;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: alignment,
                child: ClipRRect(
                  borderRadius: borderRadius(10),
                  child: Container(
                    width: width,
                    color: backgroundColor(context),
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      message.content,
                      style: messageStyle(theme.textTheme.bodyMedium),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: alignment,
                margin: const EdgeInsets.only(top: 2),
                child: Text(
                  _formatter.format(message.moment),
                  style: theme.textTheme.bodySmall,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
