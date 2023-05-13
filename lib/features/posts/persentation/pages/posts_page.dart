import 'package:clean_architecture_posts_app/features/posts/persentation/cubit/posts/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../widgets/posts_page/message_display_widget.dart';
import '../widgets/posts_page/post_list_widget.dart';
import '../../../../injection_container.dart' as di;


class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.getIt<PostsCubit>()..calAllPosts(),
      child: Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody(),
        floatingActionButton: _buildFloatingBtn(context),
      ),
    );
  }

  AppBar _buildAppbar() => AppBar(title: const Text('Posts'));

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if (state is LoadingPostsState) {
            return const LoadingWidget();
          } else if (state is LoadedPostsState) {
            return PostListWidget(posts: state.posts);
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        },
      ),
    );
  }

  Widget _buildFloatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (_) => PostAddUpdatePage(
        //           isUpdatePost: false,
        //         )));
      },
      child: const Icon(Icons.add),
    );
  }
}