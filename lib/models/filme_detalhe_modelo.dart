import 'dart:convert';

import 'package:app_filmes/models/elenco_modelo.dart';
import 'package:app_filmes/models/filme_model.dart';
import 'package:app_filmes/models/genero_modelo.dart';

class FilmeDetalheModelo {
  final String titulo;
  final double estrelas;
  final List<GeneroModelo> generos;
  final List<String> urlImagens;
  final DateTime dataLancamento;
  final String resumo;
  final List<String> companhiaProducao;
  final String linguaOriginal;
  final List<ElencoModelo> elencos;

  FilmeDetalheModelo({
    required this.titulo,
    required this.estrelas,
    required this.generos,
    required this.urlImagens,
    required this.dataLancamento,
    required this.resumo,
    required this.companhiaProducao,
    required this.linguaOriginal,
    required this.elencos,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': titulo,
      'vote_average': estrelas,
      'genres': generos.map((x) => x.toMap()).toList(),
      'urlImagens': urlImagens,
      'release_date': dataLancamento.millisecondsSinceEpoch,
      'overview': resumo,
      'production_companies': companhiaProducao,
      'original_language': linguaOriginal,
      'cast': elencos,
    };
  }

  factory FilmeDetalheModelo.fromMap(Map<String, dynamic> map) {
    var urlImagensPosters = map['images']['posters'];
    var urlImagens = urlImagensPosters
            ?.map<String>((imagem) =>
                'https://image.tmdb.org/t/p/w200${imagem['file_path']}')
            .toList() ??
        const [];

    return FilmeDetalheModelo(
      titulo: map['title'],
      estrelas: map['vote_average'] ?? 0.0,
      generos: List<GeneroModelo>.from(
          map['genres']?.map((x) => GeneroModelo.fromMap(x))),
      urlImagens: urlImagens,
      dataLancamento: DateTime.parse(map['release_date']),
      resumo: map['overview'],
      companhiaProducao:
          List<dynamic>.from(map['production_companies'] ?? const [])
              .map<String>((cp) => cp['name'])
              .toList(),
      linguaOriginal: map['original_language'],
      elencos: List<ElencoModelo>.from(
          map['credits']['cast']?.map((x) => ElencoModelo.fromMap(x)) ??
              const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmeDetalheModelo.fromJson(String source) =>
      FilmeDetalheModelo.fromMap(json.decode(source));
}
