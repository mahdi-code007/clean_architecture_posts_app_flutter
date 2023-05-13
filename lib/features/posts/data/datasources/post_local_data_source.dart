import 'dart:convert';

import 'package:clean_architecture_posts_app/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}


const CACHED_POSTS = "CACHED_POSTS";


class PostLocalDataSourceImpl implements PostLocalDataSource {

  final SharedPreferences sharedPreferences;


  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelToJson = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson()).toList();

    sharedPreferences.setString(CACHED_POSTS, json.encode(postModelToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if(jsonString != null){
      List decodedJsonData = json.decode(jsonString);
      
      List<PostModel> jsonToPostModels = decodedJsonData
          .map<PostModel>((jsonPostModel)
      => PostModel.fromJson(jsonPostModel)).toList();

      return Future.value(jsonToPostModels);
    }else{
      throw EmptyCacheException();
    }
  }
}