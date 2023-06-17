import 'package:get/get.dart';

import '../../common/base/base_view_model.dart';
import '../../widgets/bottom_sheet/default_bottom_sheet.dart';
import '../authentication/repository/post_repository.dart';
import 'model/post.dart';
import 'widget/create_post_widget.dart';

class PostPageViewModel extends BaseViewModel<List<Post?>> {
  List<Post?> listPost = [];
  final PostRepository _postRepo = Get.find<PostRepository>();

  Future<void> postAPost() async {
    Get.showDefaultBottomSheet(const DefaultBottomSheet(child: CreatePost()));
  }

  @override
  Future<List<Post?>> initialData() async {
    listPost = await _postRepo.getListPost();
    return listPost;
  }
}
