import 'package:flutter/material.dart';
import 'package:flying_school/common_widgets/avatar.dart';
import 'package:flying_school/common_widgets/platform_alert_dialog.dart';
import 'package:flying_school/common_widgets/platform_exception_alert_dialog.dart';
import 'package:flying_school/constants/keys.dart';
import 'package:flying_school/constants/string.dart';
import 'package:flying_school/core/services/authentication.dart';
import 'package:provider/provider.dart';


import 'dart:async';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
class UserMenu extends StatelessWidget {
  const UserMenu({this.isLoading});
  final bool isLoading;
  @override

  _launcher(String toMailId, String subject, String body)async{
    var url = 'malto:$toMailId?subject=$subject=&body =$body';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SizedBox(
      width:  MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: Column(children: <Widget>[
       
                 UserAccountsDrawerHeader(
                    accountName: Text("displayName"),
                    accountEmail: Text('example.gmail.com'),
                    currentAccountPicture: Avatar(
                                            photoUrl: user.photoUrl,
                                            radius: 50,
                                            borderColor: Colors.black12,
                                            borderWidth: 2.0,
                                          ),
                                        ),
            
            
          
          _buildOptions(context),
        ],),
      ),     
    );
  }
  Future<void> _signOut(BuildContext context)async{
    try{
      final AuthService auth = Provider.of<AuthService>(context);
      await auth.signOut();
    }on PlatformException catch (e){
    await PlatformExceptionAlertDialog(
      title: Strings.logoutFailed,
      exception: e,
    ).show(context);
    }
  }
  Future<void> _confirmSignOut(BuildContext context)async{
final bool didRequestSignOut = await PlatformAlertDialog(
 title:  Strings.logout,
 content: Strings.logoutAreYouSure,
 cancelActionText:  Strings.cancel,
 defaultActionText: Strings.logout,
).show(context);
if(didRequestSignOut ==true){
  _signOut(context);
}
  }
  Widget _buildOptions(BuildContext context){
    return Expanded(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.assessment),
            title: Text(Strings.vaccination),),
          ListTile(
            leading: Icon(Icons.art_track),
            title: Text(Strings.artificialInsemination),),
          ListTile(
            leading: Icon(Icons.history),
            title: Text(Strings.historicalRecords),),
           ListTile(
            leading: Icon(Icons.image),
            title: Text(Strings.gallery),),
            Divider(),
            //  ListTile(
            // leading: Icon(Icons.share),
            // title: Text(Strings.share),),
            //  ListTile(
            // leading: Icon(Icons.rate_review),
            // title: Text(Strings.rateUs),),
            ListTile(
            leading: Icon(Icons.settings),
            title: Text(Strings.settings),),
           ListTile(
             key: Key(Keys.logout),
            leading: Icon(Icons.cancel,color: Colors.red,),
            title: Text(Strings.logout),
            onTap: ()=> _confirmSignOut(context),
            )
            
        ],
      ),
    );
  }
}


