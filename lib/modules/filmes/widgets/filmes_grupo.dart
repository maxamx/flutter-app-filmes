import 'package:app_filmes/applications/ui/filmes_card.dart';
import 'package:app_filmes/models/filme_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilmesGrupo extends StatelessWidget {
  final String _titulo;
  final List<FilmeModel> filmes;
  const FilmesGrupo({Key? key, required String titulo, required this.filmes})
      : _titulo = titulo,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          _titulo,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
            height: 280,
            child: Obx(() {
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: filmes.length,
                  itemBuilder: (context, index) {
                    return FilmesCard(
                      filmeModel: filmes[index],
                    );
                  });
            })),
      ],
    );
  }
}
