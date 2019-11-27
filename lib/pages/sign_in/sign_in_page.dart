import 'package:flutter/material.dart';
import 'package:flying_school/constants/string.dart';
import 'package:flying_school/core/services/authentication.dart';
import 'package:flying_school/pages/sign_in/sign_in_button.dart';
import 'package:flying_school/pages/sign_in/sign_in_manager.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';


import 'email_password/email_password_sign_in_page.dart';


class SignInPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth =Provider.of<AuthService>(context);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      builder: (_)=> ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, ValueNotifier<bool>isLoading, __)=>
          Provider<SignInManager>(
            builder: (_)=> SignInManager(auth: auth, isLoading: isLoading),
            child: Consumer<SignInManager>(
              builder: (_, SignInManager manager, __) => SignInPage._(
                isLoading: isLoading.value,
                manager: manager,
                title: '99 Flying school'
              ),
            )
          ),
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

  Future<void> _signInWithEmailAndPassWord(BuildContext context)async{
    final navigator = Navigator.of(context);
    await EmailPasswordSignInPage.show(
      context,
      onSignedIn:navigator.pop,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: _buildSignIn(context),
          );
        }
        Widget _buildHeader(){ 
          if(isLoading){
            return Center(
        child: FlareActor(
          "images/circular.flr",
          animation: "circular",
          fit: BoxFit.contain,
          // color: Colors.green,
          ),
        );
          }
          return  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
            Container(
                    child: Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "https://firebasestorage.googleapis.com/v0/b/flutter-8ab5a.appspot.com/o/logo.jpeg?alt=media&token=8d76f53d-eb26-4313-82b2-749060f7edb1"),
                                    ),
                                  ),
                                  Container(
                                    width: 8.0,
                                  ),
                                  Container(
                                    child: Text(
                                      "99\'s Flying School.",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )]))),
                         Container(
                            // padding: EdgeInsets.fromLTRB(12.0, 200.0, 12.0, 0.0),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "We are a dedicated ﬂying training organization "
                                  "catering for the private, commercial and airline sectors.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            // height: 400,
                            child: Image.asset(
                              'images/lojgo.jpg'
                            ),
                          )

            ],

          );
         
         }
      
        Widget _buildSignIn(BuildContext context) {
          return Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 350.0,
                  child: _buildHeader(),
                ),
                SizedBox(height: 48.0,),
                SignInButton(
                  key: emailPasswordButtonKey,
                  text: Strings.signInWithEmailPassword,
                  onPressed:
                  isLoading ? null : () => _signInWithEmailAndPassWord(context),
                  textColor: Colors.white,
                  color: Colors.pink.shade900
                ),
                  SizedBox(height: 100.0,),
              ],
            ),

          );
        }
}