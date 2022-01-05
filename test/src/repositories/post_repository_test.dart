import 'package:flutter_test/flutter_test.dart';
import 'package:rede_social/src/repositories/post_repository.dart';

main() {
  final respository = PostRepository();

  test("Deve retornar uma lista de PostModel", () async {
    final list = await respository.retorneDados();
    print(list[3].userId);
  });
}
