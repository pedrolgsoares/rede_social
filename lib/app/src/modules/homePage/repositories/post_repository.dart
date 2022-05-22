import 'package:dio/dio.dart';
import 'package:rede_social/app/src/models/post_model.dart';

class PostRepository {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<PostModel>> retorneDados() async {
    final response = await dio.get(url);

    List<PostModel> posts = (response.data as List)
      .map((e) => PostModel.fromJson(e))
      .toList();


    return posts;
  }
}
