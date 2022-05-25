import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rede_social/app/src/modules/homePage/repositories/post_repository.dart';

void main() {
  final repository = PostRepository();
  test('Teste do repository', () async{
    final list = await repository.retorneDados();
    if (kDebugMode) {
      print(list);
    }
  });
}