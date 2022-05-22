import 'package:mobx/mobx.dart';
import 'package:rede_social/app/src/models/post_model.dart';
import 'package:rede_social/app/src/modules/homePage/repositories/post_repository.dart';
import 'package:rede_social/app/src/shared/status.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;
abstract class HomeControllerBase with Store{
  final PostRepository _postRepository;

  @observable
  var statusDados = Status.NAOCARREGADO;
  List<PostModel> posts = [];

  HomeControllerBase(this._postRepository);

    Future getConteudoFeed() async {
    try {
      statusDados = Status.AGUARDANDO;
      posts = await _postRepository.retorneDados();
      statusDados = Status.CONCLUIDO;
    } catch (e) {
      statusDados = Status.ERRO;
    }
  }

}