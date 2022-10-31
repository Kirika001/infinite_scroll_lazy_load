import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll/data/model/comment_model.dart';
import 'package:infinite_scroll/ui/main/main_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MainController(),
        builder: (controller) =>
            Scaffold(
              appBar:AppBar(
                title: Text("main screen"),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    snap: false,
                    pinned: true,
                    expandedHeight: 200,
                    // backgroundColor: Colors.indigo,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      title: Text("infintite scroll", style: TextStyle(
                        color: Colors.black12
                      ),),
                      background: Icon(Icons.accessibility_sharp),
                    ),
                  ),
                  SliverFillRemaining(
                    // fillOverscroll: true,
                    hasScrollBody: true,
                    child: PagedListView<int, CommentModel>(
                      pagingController: controller.pagingController,
                      builderDelegate: PagedChildBuilderDelegate<CommentModel>(
                        firstPageProgressIndicatorBuilder: (context) => const CircularProgressIndicator.adaptive(),
                        newPageProgressIndicatorBuilder: (context) => Center(
                          child: const CircularProgressIndicator.adaptive(
                          ),
                        ),
                        itemBuilder: (context, item, index) => ListTile(
                          title: Text(item.name ?? "-"),
                          subtitle: Text(item.email?? "-"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
