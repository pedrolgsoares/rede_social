import 'package:flutter/material.dart';
import 'package:rede_social/app/src/models/post_model.dart';

class DetailsPage extends StatelessWidget {
  static const String route = '/detalhes';
  final PostModel postModel;
  const DetailsPage({Key? key, required this.postModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes da publicação"),
      ),
      body: _buildDetails(),
    );
  }

  Widget _buildDetails() {
    return Container(
      padding: const EdgeInsets.all(10),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " O usuário " +
                  postModel.convertInt(postModel.id) +
                  " publicou:",
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )
          ],
        ),
        Image.network(postModel.url),
        Text(
          postModel.title,
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
      ]),
    );
  }
}
