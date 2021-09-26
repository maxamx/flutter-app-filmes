import 'package:app_filmes/applications/modules/module.dart';
import 'package:app_filmes/modules/filme_detalhe/filme_detalhe_bindings.dart';
import 'package:app_filmes/modules/filme_detalhe/filme_detalhe_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class FilmeDetalheModulo extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/filme/detalhe',
      page: () => FilmeDetalhePage(),
      binding: FilmeDetalheBindings(),
    )
  ];
}
