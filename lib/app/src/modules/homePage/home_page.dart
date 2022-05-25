import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/src/modules/homePage/controllers/home_controller.dart';
import 'package:rede_social/app/src/shared/status.dart';

class HomePage extends StatefulWidget {
  static const String route = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get();
  @override
  void initState() {
    super.initState();
    controller.getConteudoFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('App postagens'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountEmail: Text("pedrodevmob@gmail.com"),
                accountName: Text("Pedro Lucas"),
                currentAccountPicture: CircleAvatar(
                  child: Text("PL"),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Minha conta"),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Configurações"),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text("Sair do app"),
                onTap: () {
                  Navigator.pop(context);
                  //Navegar para outra página
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: _buildFeed(),
        ));
  }

  Widget _buildFeed() {
    return Observer(
      builder: (_) {
        switch (controller.statusDados) {
          case Status.NAOCARREGADO:
            return _buildNaoCarregado();
          case Status.ERRO:
            return _buildErro();
          case Status.CONCLUIDO:
            return _buildPublicacoes();
          case Status.VAZIO:
            return const Center(
              child: Text(
                'Sem nada no feed',
              ),
            );
          case Status.AGUARDANDO:
            return _buildCarregando();
          default:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildErro() {
    return const Center(child: Text('Erro ao carregar o feed, tente novamente'));
  }

  Widget _buildNaoCarregado() {
    return const Center(child: Text('Feed não carregado, tente novamente'));
  }

  Widget _buildCarregando() {
    return Column(
      children: const [
        Text('Carregando seu feed, por favor aguarde...'),
        CircularProgressIndicator()
      ],
    );
  }

  Widget _buildPublicacoes() {
    return ListView.builder(
      itemCount: controller.posts.length,
      itemBuilder: (context, index) {
        var post = controller.posts[index];

        // Container do feed
        return Container(
          color: Colors.blue[500],
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 36.0,
                  ),
                  Text(
                    " Usuário: " + post.convertInt(post.id),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Imagem do albúm: " + post.convertInt(post.albumId),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Image.network(post.thumbnailUrl),
              TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>
                  //           DetailsPage(controller.posts[index])),
                  // );
                  Modular.to.pushNamed(
                    '/detalhes' ,
                    arguments: controller.posts[index]
                  );
                },
                child: const Text(
                  'Clique aqui para mais detalhes',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
