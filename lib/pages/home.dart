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
          title: Text(
            'Ninty Nine',
            style: TextStyle(
                fontFamily: 'Righteous',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
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
              Tab(
                child: Text(
                  'Tutorials',
                  style: TextStyle(
                      fontFamily: 'Righteous',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Blog',
                  style: TextStyle(
                      fontFamily: 'Righteous',
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
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