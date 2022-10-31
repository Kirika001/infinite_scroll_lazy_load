import 'package:get/get.dart';
import 'package:infinite_scroll/data/network_core.dart';
import 'package:infinite_scroll/data/repository/repository.dart';
import 'package:infinite_scroll/data/repository/repository_impl.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore());
    Get.put<Repository>(RepositoryImpl());
  }


}