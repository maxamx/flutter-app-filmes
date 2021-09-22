import 'package:app_filmes/modules/filmes/widgets/filter_tag.dart';
import 'package:flutter/material.dart';

class FilmePage extends StatelessWidget {
  const FilmePage({Key? key}) : super(key: key);

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
