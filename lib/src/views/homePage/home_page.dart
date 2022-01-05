import 'package:flutter/material.dart';
import 'package:rede_social/src/controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _sucess() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text("Postagem: $index"),
        );
      },
    );
  }

  _error() {
    return Center(
      child: Text("Tente novamente"),
    );
  }

  _loading() {
    return Center(
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
        body: validandoEstados(HomeState.sucess));
  }
}
