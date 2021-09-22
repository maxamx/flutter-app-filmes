import 'package:app_filmes/applications/ui/filmes_card.dart';
import 'package:flutter/material.dart';

class FilmesGrupo extends StatelessWidget {
  final String _titulo;
  const FilmesGrupo({Key? key, required String titulo})
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
        FilmesCard(),
      ],
    );
  }
}
