import 'package:app_filmes/applications/ui/theme_extension.dart';
import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class FilmeDetalheConteudoTitulo extends StatelessWidget {
  final FilmeDetalheModelo? filmeDetalhe;

  const FilmeDetalheConteudoTitulo({Key? key, required this.filmeDetalhe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            filmeDetalhe?.titulo ?? '',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          RatingStars(
            value: (filmeDetalhe?.estrelas ?? 1) / 2,
            valueLabelVisibility: false,
            starColor: context.themeOrange,
            starSize: 14,
          ),
          Text(
            filmeDetalhe?.generos.map((e) => e.nome).join(', ') ?? '',
            style: TextStyle(fontSize: 11, color: context.themeGrey),
          ),
        ],
      ),
    );
  }
}
