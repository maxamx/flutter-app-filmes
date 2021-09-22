import 'package:app_filmes/applications/ui/theme_extension.dart';
import 'package:app_filmes/models/genero_modelo.dart';
import 'package:flutter/material.dart';

class FilterTag extends StatelessWidget {
  final GeneroModelo generoModelo;
  final bool _selected;
  final VoidCallback onPressed;
  const FilterTag(
      {Key? key,
      required this.generoModelo,
      selected = false,
      required this.onPressed})
      : _selected = selected,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        constraints: BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
            color: _selected ? context.themeRed : Colors.black,
            borderRadius: BorderRadius.circular(30)),
        child: Align(
            alignment: Alignment.center,
            child: Text(generoModelo.nome,
                style: TextStyle(color: Colors.white, fontSize: 14))));
  }
}
