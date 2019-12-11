import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flying_school/common_widgets/platform_alert_dialog.dart';
import 'package:flying_school/constants/string.dart';
import 'package:flying_school/core/services/firebase_email_link_handler.dart';
import 'package:provider/provider.dart';

class EmailLinkErrorPresenter extends StatefulWidget {
  const EmailLinkErrorPresenter({Key key, this.child, this.errorStream})
      : super(key: key);
  final Widget child;
  final Stream<EmailLinkError> errorStream;

  static Widget create(BuildContext context, {Widget child}) {
    final FirebaseEmailLinkHander linkHandler =
        Provider.of<FirebaseEmailLinkHander>(context);
    return EmailLinkErrorPresenter(
      child: child,
      errorStream: linkHandler.errorStream,
    );
  }

  @override
  _EmailLinkErrorPresenterState createState() =>
      _EmailLinkErrorPresenterState();
}

class _EmailLinkErrorPresenterState extends State<EmailLinkErrorPresenter> {
  StreamSubscription<EmailLinkError> _onEmailLinkErrorSubscription;

  @override
  void initState() {
    super.initState();
    _onEmailLinkErrorSubscription = widget.errorStream.listen((error) {
      PlatformAlertDialog(
        title: Strings.activationLinkError,
        content: error.message,
        defaultActionText: Strings.ok,
      ).show(context);
    });
  }

  @override
  void dispose() {
    _onEmailLinkErrorSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
