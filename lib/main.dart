import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flying_school/core/services/authentication.dart';
import 'package:flying_school/core/services/email_secure_store.dart';
import 'package:flying_school/core/services/firebase_email_link_handler.dart';
import 'package:flying_school/core/view/CrudModel.dart';

import 'package:provider/provider.dart';

import 'core/services/auth_service_adapter.dart';
import 'locator.dart';
import 'pages/authentication/auth_widget-builder.dart';
import 'pages/authentication/auth_widget.dart';
import 'pages/sign_in/email-link_error_presenter.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  setupLocator();
  runApp(MyApp());
}

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center(
    child: Text(
      'Error appeared.',
      style: TextStyle(color: Colors.red, fontSize: 24.0),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({this.initialAuthServiceType = AuthServiceType.firebase});
  final AuthServiceType initialAuthServiceType;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
        // ChangeNotifierProvider(create: (_)=> locator<CRUDSubTopicModel>()),
        ChangeNotifierProvider(
          create: (_) => locator<BlogCRUDModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => locator<NoteCRUDModel>(),
        ),
        Provider<AuthService>(
          create: (_) => AuthServiceAdapter(
            initialAuthServiceType: initialAuthServiceType,
          ),
          dispose: (_, AuthService authService) => authService.dispose(),
        ),
        Provider<EmailSecureStore>(
          create: (_) =>
              EmailSecureStore(flutterSecureStorage: FlutterSecureStorage()),
        ),
        ProxyProvider2<AuthService, EmailSecureStore, FirebaseEmailLinkHander>(
          update: (_, AuthService authService, EmailSecureStore storage, __) =>
              FirebaseEmailLinkHander.createAndConfigure(
            auth: authService,
            userCredentialsStorage: storage,
          ),
          dispose: (_, linkHandler) => linkHandler.dispose(),
        )
      ],
      child: AuthWidgetBuilder(
          builder: (context, AsyncSnapshot<User> userSnapshot) {
        return MaterialApp(
          builder: (BuildContext context, Widget widget) {
            ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
              return getErrorWidget(context, errorDetails);
            };
            return widget;
          },
          home: EmailLinkErrorPresenter.create(context,
              child: AuthWidget(userSnapshot: userSnapshot)),
          theme: ThemeData(
            primaryColor: Colors.pink.shade900,
          ),
          debugShowCheckedModeBanner: false,
          title: '99 School',
//            onGenerateRoute: Router.generateRoute,
        );
      }),
    );
  }
}
