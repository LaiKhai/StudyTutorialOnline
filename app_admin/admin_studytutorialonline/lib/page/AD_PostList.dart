import 'package:StudyTutorialOnlineAdmin/common/contrains/dimen.dart';
import 'package:flutter/material.dart';

import '../data/Posts.dart';
import '../provider/Post/PostProvider.dart';
import '../widget/HomePage/AD_HomeList.dart';

class PostList extends StatefulWidget {
  final ScrollController scrollController;
  const PostList({Key? key, required this.scrollController}) : super(key: key);

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Posts?>(
        future: PostProvider.getAllPost(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('có lỗi xảy ra'),
            );
          }
          if (snapshot.hasData) {
            return SizedBox(
              width: getWidthSize(context),
              height: getHeightSize(context),
              child: HomeList(
                lstpost: snapshot.data!,
                scrollController: widget.scrollController,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
