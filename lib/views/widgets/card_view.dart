import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 250,
      margin: EdgeInsets.all(10),
      color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          // Container da imagem
          Container(
            width: 500,
            height: 150,
            child: Image.asset('assets/images/paisagem.jpg'),
          ),
          // Container da legenda
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text('Legenda da publicação'),
                Icon(Icons.verified),
              ],
            ),
          )
        ],
      ),
    );
  }
}
