import 'package:app_filmes/applications/ui/filmes_card.dart';
import 'package:app_filmes/modules/favoritos/favorito_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritoPage extends GetView<FavoritoController> {
  const FavoritoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Favoritos'),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Wrap(
                alignment: WrapAlignment.spaceAround,
                children: controller.filmes
                    .map(
                      (f) => FilmesCard(
                          filmeModel: f,
                          favoritoCallback: () =>
                              controller.removeFavoritos(f)),
                    )
                    .toList(),
              ),
            ),
          );
        }));
  }
}
