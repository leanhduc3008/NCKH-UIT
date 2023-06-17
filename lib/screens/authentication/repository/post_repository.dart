import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../common/constants/collections.dart';
import '../../post/model/post.dart';

class PostRepository extends GetxController {
  final posts = FirebaseFirestore.instance.collection(Collections.posts);
  final Query queryPosts = FirebaseFirestore.instance
      .collection(Collections.posts)
      .orderBy('postDate', descending: true);

  Future<List<Post?>> getListPost() async {
    final datas = await queryPosts
        .withConverter<Post>(
            fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson())
        .get();
    return datas.docs.map((doc) => doc.data()).toList();
  }

  Future<void> createPost(String postId, String userName, String postDate,
      String location, String imagePost) async {
    posts.doc(postId).set({
      'postId': postId,
      'userName': userName,
      'postDate': postDate,
      'location': location,
      'imagePost': imagePost
    });
  }
}
