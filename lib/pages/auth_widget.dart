import 'package:flutter/material.dart';
import 'package:flying_school/core/services/authentication.dart';
import 'package:flying_school/pages/myhomepage.dart';
import 'package:flying_school/pages/sign_in/sign_in_page.dart';


class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}): super(key: key);
  final AsyncSnapshot<User> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if(userSnapshot.connectionState == ConnectionState.active){
      return userSnapshot.hasData ? HomePage() : SignInPageBuilder();

    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ); 
  }
}