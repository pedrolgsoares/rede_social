import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/src/modules/detailsPage/details_page_module.dart';
import 'package:rede_social/app/src/modules/homePage/controllers/home_controller.dart';
import 'package:rede_social/app/src/modules/homePage/home_page_module.dart';
import 'package:rede_social/app/src/modules/homePage/repositories/post_repository.dart';
import 'package:rede_social/app/src/modules/detailsPage/details_page.dart';

// Responsável pela injeção de dependencias pelo bind 

class AppModule extends Module {
   @override
  final List<Bind> binds = [  
    Bind.lazySingleton((i) => PostRepository()),
    Bind.lazySingleton((i) => HomeController(i.get<PostRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    // Rotas filhos
    ModuleRoute(Modular.initialRoute, module: HomePageModule()),
    
    //ModuleRoute('/detalhes', module: DetailsPageModule()),

    ModuleRoute(DetailsPage.route, module: DetailsPageModule()),
  ];
}
