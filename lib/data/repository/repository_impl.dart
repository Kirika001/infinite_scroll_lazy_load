import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll/data/model/comment_model.dart';
import 'package:infinite_scroll/data/network_core.dart';
import 'package:infinite_scroll/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<List<CommentModel>> getPageComments(int offset, int limit) async {

    try {
      List<CommentModel> listComments = [];
      var response = await network.dio.get("/comments",
          queryParameters: {"_start": offset, "_limit": limit});
      for (var comment in (response.data as List)) {
        var model = CommentModel.fromJson(comment);
        listComments.add(model);
      }
      return listComments;
    } on DioError catch (e) {
      print(e.error);
      return [];
    }

  }
}
