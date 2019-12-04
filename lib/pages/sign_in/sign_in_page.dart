import 'package:flutter/material.dart';
import 'package:flying_school/core/services/authentication.dart';
import 'package:flying_school/pages/sign_in/sign_in_manager.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:provider/provider.dart';
import 'package:loading/loading.dart';

import 'email_password/email_password_sign_in_page.dart';

class SignInPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of<AuthService>(context);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      builder: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, ValueNotifier<bool> isLoading, __) =>
            Provider<SignInManager>(
                builder: (_) => SignInManager(auth: auth, isLoading: isLoading),
                child: Consumer<SignInManager>(
                  builder: (_, SignInManager manager, __) => SignInPage._(
                      isLoading: isLoading.value,
                      manager: manager,
                      title: '99 Flying school'),
                )),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage._({Key key, this.isLoading, this.manager, this.title})
      : super(key: key);

  final SignInManager manager;
  final String title;
  final bool isLoading;

  static const Key emailPasswordButtonKey = Key('email-password');

  Future<void> _signInWithEmailAndPassWord(BuildContext context) async {
    final navigator = Navigator.of(context);
    await EmailPasswordSignInPage.show(
      context,
      onSignedIn: navigator.pop,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSignIn(context),

      // body: _buildSignIn(context),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    if (isLoading) {
      return Center(
        child: Loading(
          color: Colors.pink,
          indicator: BallPulseIndicator(),
          size: 100.0,
        ),
      );
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              colors: [Colors.pink[900], Colors.pink[900], Colors.pink[800]])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "99\'s Flying School.",
                  style: TextStyle(
                      fontFamily: 'Righteous',
                      color: Colors.white,
                      fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontFamily: 'Righteous',
                      color: Colors.white,
                      fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Column(children: <Widget>[
                  Image.asset("images/logo.jpg"),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.pink[900]),
                    child: FlatButton(
                      key: emailPasswordButtonKey,
                      onPressed: isLoading
                          ? Center(
                              child: Loading(
                                color: Colors.pink,
                                indicator: BallPulseIndicator(),
                                size: 100.0,
                              ),
                            )
                          : () => _signInWithEmailAndPassWord(context),
                      child: Center(
                        child: Text(
                          "JOIN NINTY NINE TODAY",
                          style: TextStyle(
                              fontFamily: 'Righteous',
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
