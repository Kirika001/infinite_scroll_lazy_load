import 'dart:async';

import 'package:infinite_scroll/data/model/comment_model.dart';

abstract class Repository{
  FutureOr<List<CommentModel>> getPageComments(int offset, int limit);
}