import 'package:flutter/widgets.dart';
import 'package:rede_social/src/app/models/post_model.dart';
import 'package:rede_social/src/app/repositories/post_repository.dart';

class HomeController {
  List<PostModel> posts = [];
  final repositoryPost = PostRepository();
  final state = ValueNotifier<HomeState>(HomeState.start);

  Future start() async {
    state.value = HomeState.loading;
    try {
      posts = await repositoryPost.retorneDados();
      state.value = HomeState.sucess;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, sucess, error }
