import 'package:flutter/material.dart';
import 'package:flying_school/common_widgets/avatar.dart';
import 'package:flying_school/common_widgets/platform_alert_dialog.dart';
import 'package:flying_school/common_widgets/platform_exception_alert_dialog.dart';
import 'package:flying_school/constants/string.dart';
import 'package:flying_school/core/services/authentication.dart';
import 'package:flying_school/pages/blog/newstories.dart';
import 'package:flying_school/pages/settings/aboutnintynine.dart';
import 'package:flying_school/pages/settings/help.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flying_school/pages/settings.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({this.isLoading});
  final bool isLoading;

  _launcher(String toMailId, String subject, String body)async{
    var url = 'malto:$toMailId?subject=$subject=&body =$body';
    if(await canLaunch(url)){
      await launch(url);
    }else{
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Drawer(
        child: Column(
          children: <Widget>[
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
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final AuthService auth = Provider.of<AuthService>(context);
      await auth.signOut();
    } on PlatformException catch (e) {
      await PlatformExceptionAlertDialog(
        title: Strings.logoutFailed,
        exception: e,
      ).show(context);
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final bool didRequestSignOut = await PlatformAlertDialog(
      title: Strings.logout,
      content: Strings.logoutAreYouSure,
      cancelActionText: Strings.cancel,
      defaultActionText: Strings.logout,
    ).show(context);
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Widget _buildOptions(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          ListTile(
              trailing: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pop();
              }),
          ListTile(
              trailing: Icon(
                Icons.edit,
                color: Colors.black,
              ),
              title: Text('New Story'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> NewStories()));
              }),
          ListTile(
              trailing: Icon(
                Icons.rss_feed,
                color: Colors.black,
              ),
              title: Text('My Stories'),
              onTap: () {}),
          Divider(),
          ListTile(
              title: Text(
                'About Ninty Nine School',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.greenAccent.shade700,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context, 
                 MaterialPageRoute (builder: (context)=> AboutNintyNite()));
              }),
          Divider(),
          ListTile(
              leading: Icon(
                Icons.help_outline,
                color: Colors.purple,
              ),
              title: Text('Help'),
              onTap: () {
                Navigator.push(context, 
                MaterialPageRoute(builder: (context)=> Help()));
              }),
          ListTile(
              leading: Icon(
                Icons.rate_review,
                color: Colors.yellow,
              ),
              title: Text('Rate the App'),
              onTap: () {}),
          ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.black,
              ),
              title: Text('Share'),
              onTap: ()=> Share.share('check out my website https://example.com', subject: 'Look whassssst I made!')),          ListTile(
              leading: Icon(
                Icons.feedback,
                color: Colors.indigo,
              ),
              title: Text('App Support Feedback'),
              onTap: () {_launcher('alexmaina79@gmail.com', 'Android App Support & FeedBack', 'Hello support Team');}),
          Divider(),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                child: Row(children: <Widget>[
                  Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Settings')
                ]),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                },
              ),
              FlatButton(
                child: Row(children: <Widget>[
                  Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Sign Out')
                ]),
                onPressed: () {
                  _confirmSignOut(context);
                },
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
