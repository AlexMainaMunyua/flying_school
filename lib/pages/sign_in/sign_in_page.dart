import 'package:flutter/material.dart';
import 'package:flying_school/animation.dart';
import 'package:flying_school/constants/string.dart';
import 'package:flying_school/core/services/authentication.dart';
import 'package:flying_school/pages/sign_in/sign_in_button.dart';
import 'package:flying_school/pages/sign_in/sign_in_manager.dart';
import 'package:flying_school/waderningcude.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';

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
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                    child: Column(
                      children: <Widget>[
                        // Image.asset("images/logo.jpg")
                        /*  Center(

                          child: Container(
                            // height: ,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey[200]))),
                            child:  Center(
                              child: Image.asset("images/logo.jpg")
                            )
                              
                            
                          ),
                        ), */
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SignInButton(
                      key: emailPasswordButtonKey,
                      text: Strings.signInWithEmailPassword,
                      onPressed: isLoading
                          ? null
                          : () => _signInWithEmailAndPassWord(context),
                      textColor: Colors.white,
                      color: Colors.pink.shade900),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
