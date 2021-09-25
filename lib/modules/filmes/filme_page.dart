import 'package:app_filmes/modules/filmes/filmes_controller.dart';
import 'package:app_filmes/modules/filmes/widgets/filmes_grupo.dart';
import 'package:app_filmes/modules/filmes/widgets/filmes_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/filmes_filtros.dart';

class FilmePage extends GetView<FilmesController> {
  const FilmePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width,
        child: ListView(
          children: [
            FilmesHeader(),
            FilmesFiltros(),
            FilmesGrupo(
              titulo: 'Mais Populares',
              filmes: controller.filmesPopulares,
            ),
            FilmesGrupo(
              titulo: 'Top Filmes',
              filmes: controller.filmesTops,
            ),
          ],
        ));
  }
}
