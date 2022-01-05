import 'package:dio/dio.dart';
import 'package:rede_social/src/models/post_model.dart';

class PostRepository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> retorneDados() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<PostModel> posts = [];
    for (var json in list) {
      final post = PostModel.fromJson(json);
      posts.add(post);
    }

    return posts;
  }
}
