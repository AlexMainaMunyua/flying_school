import 'package:flutter/material.dart';

class TimeLine extends StatelessWidget {
  const TimeLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog timeline',style: TextStyle(fontFamily: 'Righteous',),),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Choose a time period.',
                style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Righteous',)
              ),
            ),
            Container(
              color: Colors.pink[900],
              child: ListTile(
                title: Text(
                  'Default (December 01, 2019- Mar 31, 2020)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Righteous',color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Past',
                style: TextStyle(fontFamily:'Righteous',fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            ListTile(
              subtitle: Column(
                children: <Widget>[
                  Container(
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('Last Week (Monday -Sunday)',style: TextStyle(fontFamily: 'Righteous',),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('Last Month (November, 2019)',style: TextStyle(fontFamily: 'Righteous',),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('Last Year (2018)',style: TextStyle(fontFamily: 'Righteous',),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('Last Decade (2000 -2010)',style: TextStyle(fontFamily: 'Righteous',),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Present',
                style: TextStyle(fontFamily: 'Righteous',fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            ListTile(
              subtitle: Column(
                children: <Widget>[
                  Container(
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('This Week (Monday -Sunday)',style: TextStyle(fontFamily: 'Righteous',),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('This Month (December, 2019)',style: TextStyle(fontFamily: 'Righteous',),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('This Year (2019)',style: TextStyle(fontFamily: 'Righteous',),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text('This Decade (2000 -2010)',style: TextStyle(fontFamily: 'Righteous',),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Custom Range',
                style: TextStyle(fontFamily: 'Righteous',fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
