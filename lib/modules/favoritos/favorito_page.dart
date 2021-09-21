import 'package:flutter/material.dart';

class FavoritoPage extends StatelessWidget {
  const FavoritoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Favoritos'),
      ),
      body: Text('Favorito'),
    );
  }
}
