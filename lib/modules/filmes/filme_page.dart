import 'package:app_filmes/modules/filmes/widgets/filmes_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/filmes_filtros.dart';

class FilmePage extends StatelessWidget {
  const FilmePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: Get.width,
        child: ListView(
          children: [
            FilmesHeader(),
            FilmesFiltros(),
          ],
        ));
  }
}
