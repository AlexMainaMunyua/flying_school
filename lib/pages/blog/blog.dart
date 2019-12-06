import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flying_school/core/model/topicsModel.dart';
import 'package:flying_school/core/view/CrudModel.dart';
import 'package:intl/intl.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  List<Blog> blog;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 6000));

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final blogProvider = Provider.of<BlogCRUDModel>(context);
    return StreamBuilder<QuerySnapshot>(
      stream: blogProvider.fetchBlogAsStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          blog = snapshot.data.documents
              .map((doc) => Blog.fromMap(doc.data, doc.documentID))
              .toList();
          return ListView.builder(
            itemCount: blog.length,
            itemBuilder: (context, index) => BlogBuilder(blog: blog[index]),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.pink,
            )
            /* child: Loading(
              color: Colors.pink,
              indicator: BallPulseIndicator(),
              size: 100.0,
            ), */
          );
        }
      },
    );
  }
}

class BlogBuilder extends StatelessWidget {
  const BlogBuilder({Key key, this.blog}) : super(key: key);

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatedDate = DateFormat('d MMM').format(now);
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (_) => BlogDetails(blog: blog)));
        print('tapped');
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  height: 100,
                  width: 120,
                  child: Image.network(
                    '${blog.blogImage}',
                    fit: BoxFit.fill,
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '${blog.authorName}.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.greenAccent[700]),
                              ),
                              Text(
                                formatedDate,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.greenAccent[700]),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${blog.blogTopicName}.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )),
                      SizedBox(
                        height: 5.0,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '${blog.blogDescription}.',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.grey),
                          ))
                    ],
                  )),
                ),
              )
            ],
          ),
          Divider(
            color: Colors.black45,
          ),
        ]),
      ),
    );
  }
}

class BlogDetails extends StatefulWidget {
  BlogDetails({Key key, this.blog}) : super(key: key);

  final Blog blog;

  @override
  _BlogDetailsState createState() => _BlogDetailsState();
}

class _BlogDetailsState extends State<BlogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.blog.blogTopicName}'),
      ),
    );
  }
}
