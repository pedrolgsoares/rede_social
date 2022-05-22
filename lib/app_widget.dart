import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:one_context/one_context.dart';




 // APP WIDGET: ADICIONAR COISAS INICIAIS
class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
       routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      builder: OneContext().builder,
    );
  }
}