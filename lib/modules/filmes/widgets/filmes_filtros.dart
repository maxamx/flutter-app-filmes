import 'package:flutter/material.dart';

import 'filter_tag.dart';

class FilmesFiltros extends StatelessWidget {
  const FilmesFiltros({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterTag(),
            ],
          )),
    );
  }
}
