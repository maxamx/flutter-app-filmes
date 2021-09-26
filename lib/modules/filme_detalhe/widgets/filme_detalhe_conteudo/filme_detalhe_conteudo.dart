import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:flutter/material.dart';

import 'filme_detalhe_conteudo_titulo.dart';

class FilmeDetalheConteudo extends StatelessWidget {
  final FilmeDetalheModelo? filmeDetalhe;
  const FilmeDetalheConteudo({Key? key, required this.filmeDetalhe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FilmeDetalheConteudoTitulo(
          filmeDetalhe: filmeDetalhe,
        ),
      ],
    );
  }
}
