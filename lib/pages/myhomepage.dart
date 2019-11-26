import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flying_school/common_widgets/platform_alert_dialog.dart';
import 'package:flying_school/common_widgets/platform_exception_alert_dialog.dart';
import 'package:flying_school/constants/keys.dart';
import 'package:flying_school/constants/string.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/core/services/authentication.dart';
import 'package:flying_school/core/view/CrudModel.dart';
import 'package:flying_school/pages/topicBuilder.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';



class HomePage extends StatefulWidget {
  const HomePage({this.isLoading});
  final bool isLoading;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
List<Topics> topics;
Future<void> _signOut(BuildContext context) async{
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

Future<void> _confirmSignOut(BuildContext context) async {
  final bool didRequestSignOut = await PlatformAlertDialog(
     title: Strings.logout,
     content: Strings.logoutAreYouSure,
     cancelActionText: Strings.cancel,
     defaultActionText: Strings.logout,
  ).show(context);
  if(didRequestSignOut ==true ){
    _signOut(context);
      }
    }

      @override
      Widget build(BuildContext context) {
        final user = Provider.of<User>(context);
        final topicProvider =Provider.of<CRUDModel>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(Strings.homePage),
            actions: <Widget>[
                           FlatButton(
                key: Key(Keys.logout,),
                child: Text(
                  Strings.logout,
                  style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  ),
                ),
                onPressed: ()=> _confirmSignOut(context),
              )
            ],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: topicProvider.fetchTopicsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(snapshot.hasData){
                topics =snapshot.data.documents
                .map((doc)=> Topics.fromMap(doc.data,doc.documentID))
                .toList();
                return ListView.builder(
                  itemCount: topics.length,
                  itemBuilder: (context, index)=>
                  TopicBuilder(topic: topics[index]),
                );
              }else{
                return Center(child: const CircularProgressIndicator(),);
              }
            },
          ),

         );
      }
}

            
            