import 'dart:convert';

class ElencoModelo {
  final String nome;
  final String imagem;
  final String personagem;

  ElencoModelo({
    required this.nome,
    required this.imagem,
    required this.personagem,
  });

  Map<String, dynamic> toMap() {
    return {
      'original_name': nome,
      'profile_path': imagem,
      'character': personagem,
    };
  }

  factory ElencoModelo.fromMap(Map<String, dynamic> map) {
    return ElencoModelo(
      nome: map['original_name'],
      imagem: 'https://image.tmdb.org/t/p/w200${map['profile_path']}',
      personagem: map['character'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ElencoModelo.fromJson(String source) =>
      ElencoModelo.fromMap(json.decode(source));
}
