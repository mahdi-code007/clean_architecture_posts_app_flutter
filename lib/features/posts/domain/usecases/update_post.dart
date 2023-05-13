import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/posts.dart';
import '../repositories/posts_repository.dart';

class UpdatePostUsecase {
  final PostsRepository repository;

  UpdatePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repository.updatePost(post);
  }
}