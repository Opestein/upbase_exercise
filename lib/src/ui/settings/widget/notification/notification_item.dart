import 'package:flutter/material.dart';
import 'package:upbaseexercise/src/app.dart';
import 'package:upbaseexercise/src/app_translations.dart';
import 'package:upbaseexercise/src/ui/general_widgets/boolean_item.dart';
import 'package:upbaseexercise/src/ui/settings/widget/option/options.dart';

class NotificationItem extends StatefulWidget {
  NotificationItem(
    this.options,
  );

  SettingOptions options;

  @override
  _NotificationItemState createState() => _NotificationItemState(options);
}

class _NotificationItemState extends State<NotificationItem> {
  SettingOptions options;

  _NotificationItemState(
    this.options,
  );

  String notificationText;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    notificationText = AppTranslations.of(context).text("notification");
  }

  @override
  Widget build(BuildContext context) {
    final provider = UpbaseApp.of(context);

    options = provider.options;

    return BooleanItem(
      notificationText,
      options.notification,
      (bool value) {
        setState(() {
          value = !options.notification;
          provider.handleOptionsChanged(
            widget.options.copyWith(
              notification: !value,
            ),
          );
        });
      },
      switchKey: const Key('notification'),
    );
  }
}
