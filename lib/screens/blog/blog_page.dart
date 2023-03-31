import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/provider/blog_provider.dart';
import 'create_blog/create_blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlogPage extends StatefulWidget {
  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  CrudMethods crudMethods = CrudMethods();

  Stream blogsStream = FirebaseFirestore.instance.collection("blogs").snapshots();

  Widget BlogsList() {
    return Container(
      child: blogsStream != null
          ? Column(
        children: <Widget>[
          StreamBuilder(
            stream: blogsStream,
            builder: (context, snapshot) {
              if(!snapshot.hasData) {
                print (snapshot.data);
                return Center(child: CircularProgressIndicator());
              }
              else {
              return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BlogsTile(
                      authorName: snapshot
                          .data.docs[index].data['authorName'],
                      title: snapshot.data.docs[index].data["title"],
                      description:
                      snapshot.data.docs[index].data['desc'],
                      imgUrl:
                      snapshot.data.docs[index].data['imgUrl'],
                    );
                  });}
            },
          )
        ],
      )
          : Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    // crudMethods.getData().then((result) {
    //   setState(() {
    //     blogsStream = result;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Blog",
              style: TextStyle(fontSize: 22, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: BlogsList(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class BlogsTile extends StatelessWidget {
  String imgUrl = '', title = '', description = '', authorName= '';
  BlogsTile(
      {required this.imgUrl,
        required this.title,
        required this.description,
        required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 150,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 170,
            decoration: BoxDecoration(
                color: Colors.black45.withOpacity(0.3),
                borderRadius: BorderRadius.circular(6)),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(authorName)
              ],
            ),
          )
        ],
      ),
    );
  }
}
