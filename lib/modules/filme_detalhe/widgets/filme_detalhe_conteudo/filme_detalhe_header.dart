import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FilmeDetalheHeader extends StatelessWidget {
  final FilmeDetalheModelo? filmeDetalhe;

  const FilmeDetalheHeader({Key? key, required this.filmeDetalhe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var filmeDetalheData = filmeDetalhe;
    if (filmeDetalheData != null) {
      return SizedBox(
        height: 248,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: filmeDetalhe!.urlImagens.length,
          itemBuilder: (context, index) {
            final imagem = filmeDetalheData.urlImagens[index];
            return Padding(
              padding: EdgeInsets.all(2),
              child: FadeInImage.memoryNetwork(
                image: imagem,
                placeholder: kTransparentImage,
              ),
            );
          },
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
