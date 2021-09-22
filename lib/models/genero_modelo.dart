import 'dart:convert';

class GeneroModelo {
  final int id;
  final String nome;

  GeneroModelo({
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': nome,
    };
  }

  factory GeneroModelo.fromMap(Map<String, dynamic> map) {
    return GeneroModelo(
      id: map['id'],
      nome: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GeneroModelo.fromJson(String source) =>
      GeneroModelo.fromMap(json.decode(source));
}
