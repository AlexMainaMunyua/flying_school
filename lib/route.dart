import 'package:flutter/material.dart';
import 'package:flying_school/pages/myhomepage.dart';


class Router{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case '/':
        return MaterialPageRoute(
            // builder: (_)=> RootPage(auth: Auth())
            builder: (_ )=> HomePage()
                    );
      default:
        return MaterialPageRoute(
          builder: (_)=> Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          )
        );
    }
  }
}