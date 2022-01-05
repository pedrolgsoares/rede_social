import 'package:flutter_test/flutter_test.dart';
import 'package:rede_social/src/controllers/home_controller.dart';

main() {
  final controller = HomeController();
  test("Deve preencher variável posts e os estados estarem OK", () async {
    expect(controller.state, HomeState.start);
    await controller.start();
    expect(controller.state, HomeState.sucess);
    expect(controller.posts.isNotEmpty, true);
  });
}
