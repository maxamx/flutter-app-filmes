import 'package:app_filmes/modules/filmes/filmes_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'filter_tag.dart';

class FilmesFiltros extends GetView<FilmesController> {
  const FilmesFiltros({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Obx(() {
          return Row(
            children: controller.generos
                .map(
                  (g) => FilterTag(
                    generoModelo: g,
                    onPressed: () => controller.filtroFilmesPorGenero(g),
                    selected: controller.generoSelecionado.value?.id == g.id,
                  ),
                )
                .toList(),
          );
        }),
      ),
    );
  }
}
