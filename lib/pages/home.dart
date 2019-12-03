import 'package:flutter/material.dart';
import 'package:flying_school/pages/settings/timeline.dart';
import 'blog/blog.dart';
import 'homepage/myhomepage.dart';
import 'settings/search.dart';
import 'settings/userDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Ninty Nine'),
          actions: <Widget>[
            // IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                }),
            IconButton(
                icon: Icon(Icons.timeline),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TimeLine()));
                }),
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            tabs: <Widget>[
              Tab(text: 'Tutorials'),
              Tab(text: 'Blog'),
            ],
          ),
        ),
        drawer: UserDrawer(),
        body: TabBarView(
          children: <Widget>[
            MyHomePage(),
            BlogPage(),
          ],
        ),
      ),
    );
  }
}
