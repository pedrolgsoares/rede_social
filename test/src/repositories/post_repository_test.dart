import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rede_social/src/app/repositories/post_repository.dart';

main() {
  final respository = PostRepository();

  test("Deve retornar uma lista de PostModel", () async {
    final list = await respository.retorneDados();
    if (kDebugMode) {
      print(list);
    }
  });
}
