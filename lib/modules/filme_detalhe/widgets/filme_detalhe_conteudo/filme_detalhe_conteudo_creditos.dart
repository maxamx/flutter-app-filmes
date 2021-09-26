import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:flutter/material.dart';

class FilmeDetalheConteudoCreditos extends StatelessWidget {
  final FilmeDetalheModelo? filmeDetalhe;

  const FilmeDetalheConteudoCreditos({Key? key, required this.filmeDetalhe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 50),
        child: Text(
          filmeDetalhe?.resumo ?? '',
          style: TextStyle(fontSize: 14, height: 1.3),
        ),
      ),
    );
  }
}
