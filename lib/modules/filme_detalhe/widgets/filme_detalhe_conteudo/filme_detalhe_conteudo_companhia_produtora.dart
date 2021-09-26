import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:flutter/material.dart';

class FilmeDetalheConteudoCompanhiaProdutora extends StatelessWidget {
  final FilmeDetalheModelo? filmeDetalhe;

  const FilmeDetalheConteudoCompanhiaProdutora(
      {Key? key, required this.filmeDetalhe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
            text: 'Companhia(s) produtora(s): ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF222222),
            ),
            children: [
              TextSpan(
                text: filmeDetalhe?.companhiaProducao.join(', ') ?? '',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF222222),
                ),
              ),
            ]),
      ),
    );
  }
}
