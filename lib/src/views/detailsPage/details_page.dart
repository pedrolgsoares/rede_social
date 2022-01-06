import 'package:flutter/material.dart';
import 'package:rede_social/src/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  final PostModel postModel;
  const DetailsPage(this.postModel, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes da publicação"),
        actions: [Icon(Icons.share)],
      ),
      body: _details(),
    );
  }

  _details() {
    return Container(
      padding: const EdgeInsets.all(10),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                " O usuário " +
                    postModel.convertInt(postModel.id!) +
                    " publicou:",
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
        Image.network(postModel.url!),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                postModel.title!,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
              Container(
                margin: const EdgeInsets.all(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Salvar imagem"),
                    Icon(Icons.save_outlined)
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
