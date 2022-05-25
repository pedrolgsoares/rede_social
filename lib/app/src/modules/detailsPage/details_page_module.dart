import 'package:flutter_modular/flutter_modular.dart';
import 'package:rede_social/app/src/modules/detailsPage/details_page.dart';

class DetailsPageModule extends Module {

    @override
  final List<Bind> binds = [
   
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