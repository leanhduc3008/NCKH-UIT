import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/provider/blog_provider.dart';
import 'create_blog/create_blog.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  BlogPageState createState() => BlogPageState();
}

class BlogPageState extends State<BlogPage> {
  CrudMethods crudMethods = CrudMethods();

  Stream blogsStream =
      FirebaseFirestore.instance.collection('blogs').snapshots();

  Widget blogsList() {
    return Column(
        children: <Widget>[
          StreamBuilder(
            stream: blogsStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: snapshot.data.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BlogsTile(
                        authorName:
                            snapshot.data.docs[index].data['authorName'],
                        title: snapshot.data.docs[index].data["title"],
                        description:
                            snapshot.data.docs[index].data['desc'],
                        imgUrl: snapshot.data.docs[index].data['imgUrl'],
                      );
                    });
              }
            },
          )
        ],
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
          children: const <Widget>[
            Text(
              'Blog',
              style: TextStyle(fontSize: 22, color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: blogsList(),
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
              },
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

class BlogsTile extends StatelessWidget {
  const BlogsTile(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.authorName});
  final String imgUrl;
  final String title;
  final String description;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  description,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
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
