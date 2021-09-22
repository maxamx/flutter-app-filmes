import 'package:flutter/material.dart';

class FilmesCard extends StatelessWidget {
  const FilmesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 280,
      child: Stack(
        children: [
          Image.network(
              'https://images-eu.ssl-images-amazon.com/images/I/51Qma1Xm19L._SY291_BO1,204,203,200_QL40_ML2_.jpg'),
        ],
      ),
    );
  }
}
