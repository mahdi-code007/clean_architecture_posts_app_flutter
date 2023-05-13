
import 'package:clean_architecture_posts_app/core/error/failures.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/entities/posts.dart';
import 'package:clean_architecture_posts_app/features/posts/domain/repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUsecase{

  final PostsRepository repository;

  GetAllPostsUsecase(this.repository);

  Future<Either<Failure , List<Post>>> call() async{
    return await repository.getAllPosts();
  }
}