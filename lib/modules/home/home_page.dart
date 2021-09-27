import 'package:app_filmes/applications/ui/filmes_app_icons.dart';
import 'package:app_filmes/applications/ui/theme_extension.dart';
import 'package:app_filmes/modules/favoritos/favorito_bindings.dart';
import 'package:app_filmes/modules/favoritos/favorito_page.dart';
import 'package:app_filmes/modules/filmes/filme_page.dart';
import 'package:app_filmes/modules/filmes/filmes_bindings.dart';
import 'package:app_filmes/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.gotToPage,
          currentIndex: controller.pageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Filmes',
            ),
            BottomNavigationBarItem(
              icon: Icon(FilmesAppIcons.heart_empty),
              label: 'Favoritos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined),
              label: 'Sair',
            ),
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/filmes',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/filmes') {
            return GetPageRoute(
              settings: settings,
              page: () => FilmePage(),
              binding: FilmesBindings(),
            );
          }

          if (settings.name == '/favoritos') {
            return GetPageRoute(
              settings: settings,
              page: () => FavoritoPage(),
              binding: FavoritoBindings(),
            );
          }
          return null;
        },
      ),
    );
  }
}
