import 'package:app_filmes/applications/ui/theme_extension.dart';
import 'package:app_filmes/models/elenco_modelo.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class FilmeElenco extends StatelessWidget {
  final ElencoModelo? elencoModelo;
  const FilmeElenco({Key? key, required this.elencoModelo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.memoryNetwork(
              image: elencoModelo?.imagem ?? '',
              height: 85,
              width: 85,
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
            ),
          ),
          Text(
            elencoModelo?.nome ?? '',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            elencoModelo?.personagem ?? '',
            style: TextStyle(
              fontSize: 12,
              color: context.themeGrey,
            ),
          ),
        ],
      ),
    );
  }
}
