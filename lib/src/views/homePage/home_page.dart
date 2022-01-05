import 'package:flutter/material.dart';
import 'package:rede_social/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
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
          color: Colors.amber,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          // Container => Usuario
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
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
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(post.title!),
                  ],
                ),
              ),
              // TextButton(
              //   style: TextButton.styleFrom(
              //       backgroundColor: Colors.red,
              //       elevation: 15,
              //       shadowColor: Colors.green),
              //   child: Text(
              //     'Mais detalhes da publicação',
              //     style: TextStyle(
              //       color: Colors.black,
              //     ),
              //   ),
              //   onPressed: () {},
              // ),
              // Este container englobará a segunda requisição de outra API
              Container(
                child: Image.network("https://via.placeholder.com/600/92c952"),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text('Clique aqui para mais detalhes'))
            ],
          ),
        );
      },
    );
  }

  _error() {
    return const Center(
      child: const Text("Tente novamente"),
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
    // TODO: implement initState
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
