import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/src/modules/detailsPage/details_page.dart';
import 'package:rede_social/app/src/modules/homePage/controllers/home_controller.dart';
import 'package:rede_social/app/src/modules/homePage/repositories/post_repository.dart';

class DetailsPageModule extends Module {

    @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PostRepository()),
    Bind.lazySingleton((i) => HomeController(i.get<PostRepository>())),
  ];
   @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) =>  DetailsPage(
        postModel: args.data,
      ),
    ),
  ];
  
}