import 'package:flutter/material.dart';
import 'package:rede_social/src/app/controllers/home_controller.dart';
import 'package:rede_social/src/app/views/detailsPage/details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  _sucess() {
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
                    " Usuário: " + post.convertInt(post.id!),
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
                      "Imagem do albúm: " + post.convertInt(post.albumId!),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Image.network(post.thumbnailUrl!),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailsPage(controller.posts[index])),
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

  _error() {
    return const Center(
      child: Text("Tente novamente"),
    );
  }

  _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  _start() {
    return Container();
  }

  // Método para os Estados
  validandoEstados(HomeState state) {
    switch (state) {
      case HomeState.start:
        return _start();
      case HomeState.sucess:
        return _sucess();
      case HomeState.loading:
        return _loading();
      case HomeState.error:
        return _error();
      default:
    }
  }

  @override
  void initState() {
    super.initState();
    controller.start();
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
        body: AnimatedBuilder(
          animation: controller.state,
          builder: (context, child) {
            return validandoEstados(controller.state.value);
          },
        ));
  }
}
