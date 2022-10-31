import 'package:get/get.dart';
import 'package:infinite_scroll/data/model/comment_model.dart';
import 'package:infinite_scroll/data/repository/repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainController extends GetxController{
  final repository = Get.find<Repository>();

  static const limit = 10;

  final PagingController<int, CommentModel> pagingController =
  PagingController(firstPageKey: 0);

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }

  Future<void> _fetchPage(int offset) async {
    try {
      final newItems = await repository.getPageComments(offset, limit);
      final isLastPage = newItems.length < limit;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = offset + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }
}