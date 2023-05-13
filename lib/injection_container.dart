import 'package:clean_architecture_posts_app/features/posts/persentation/cubit/posts/posts_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/posts/data/datasources/post_local_data_source.dart';
import 'features/posts/data/datasources/post_remote_data_source.dart';
import 'features/posts/data/repositories/post_repository_impl.dart';
import 'features/posts/domain/repositories/posts_repository.dart';
import 'features/posts/domain/usecases/add_post.dart';
import 'features/posts/domain/usecases/delete_post.dart';
import 'features/posts/domain/usecases/get_all_posts.dart';
import 'features/posts/domain/usecases/update_post.dart';

import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> init() async {

  // Cubits

  getIt.registerFactory(() => PostsCubit(getAllPosts: getIt()));

  // Usecases

  getIt.registerLazySingleton(() => GetAllPostsUsecase(getIt()));
  getIt.registerLazySingleton(() => AddPostUsecase(getIt()));
  getIt.registerLazySingleton(() => DeletePostUsecase(getIt()));
  getIt.registerLazySingleton(() => UpdatePostUsecase(getIt()));

  // Repository

  getIt.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl(
      remoteDataSource: getIt(), localDataSource: getIt(), networkInfo: getIt()));

  // Datasources

  getIt.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: getIt()));
  getIt.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: getIt()));

  //! Core

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
