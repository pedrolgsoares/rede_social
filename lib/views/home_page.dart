import 'package:flutter/material.dart';
import 'package:rede_social/views/widgets/card_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InstaBook'),
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
      body: Container(
          child: ListView(
        children: <Widget>[
          CardView(),
          CardView(),
          CardView(),
          CardView(),
          CardView(),
        ],
      )),
    );
  }
}
