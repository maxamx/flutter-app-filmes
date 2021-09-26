import 'dart:convert';

class FilmeModel {
  final int id;
  final String titulo;
  final String dataLancamento;
  final String caminhoImagemPoster;
  final List<int> generos;
  final bool favorito;
  FilmeModel({
    required this.id,
    required this.titulo,
    required this.dataLancamento,
    required this.caminhoImagemPoster,
    required this.generos,
    required this.favorito,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': titulo,
      'release_date': dataLancamento,
      'poster_path': caminhoImagemPoster,
      'genre_ids': generos,
      'favorite': favorito,
    };
  }

  factory FilmeModel.fromMap(Map<String, dynamic> map) {
    return FilmeModel(
      id: map['id'] ?? 0,
      titulo: map['title'] ?? '',
      dataLancamento: map['release_date'] ?? '',
      caminhoImagemPoster: map['poster_path'],
      generos: List<int>.from(map['genre_ids'] ?? const []),
      favorito: map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory FilmeModel.fromJson(String source) =>
      FilmeModel.fromMap(json.decode(source));

  FilmeModel copyWith({
    int? id,
    String? titulo,
    String? dataLancamento,
    String? caminhoImagemPoster,
    List<int>? generos,
    bool? favorito,
  }) {
    return FilmeModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      dataLancamento: dataLancamento ?? this.dataLancamento,
      caminhoImagemPoster: caminhoImagemPoster ?? this.caminhoImagemPoster,
      generos: generos ?? this.generos,
      favorito: favorito ?? this.favorito,
    );
  }
}
