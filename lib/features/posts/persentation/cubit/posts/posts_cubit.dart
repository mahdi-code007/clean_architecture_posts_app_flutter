import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../domain/entities/posts.dart';
import '../../../domain/usecases/get_all_posts.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit({required this.getAllPosts}) : super(PostsInitial());
  final GetAllPostsUsecase getAllPosts;


  void calAllPosts() async {
    emit(LoadingPostsState());
    final failureOrPosts = await getAllPosts();
    emit(_mapFailureOrPostsToState(failureOrPosts));
  }


  PostsState _mapFailureOrPostsToState(Either<Failure, List<Post>> either) {
    return either.fold(
          (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
          (posts) {
            log(posts.toString());
            return LoadedPostsState(
              posts: posts,
            );
          }
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}


