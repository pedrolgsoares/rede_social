import 'package:rede_social/src/models/post_model.dart';
import 'package:rede_social/src/repositories/post_repository.dart';

class HomeController {
  List<PostModel> posts = [];
  final repository = PostRepository();

  HomeState state = HomeState.start;

  Future start() async {
    state = HomeState.loading;
    try {
      posts = await repository.retorneDados();
      state = HomeState.sucess;
    } catch (e) {
      state = HomeState.error;
    }
  }
}

enum HomeState { start, loading, sucess, error }
