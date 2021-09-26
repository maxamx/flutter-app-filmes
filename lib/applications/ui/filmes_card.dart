import 'package:app_filmes/applications/ui/filmes_app_icons.dart';
import 'package:app_filmes/models/filme_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FilmesCard extends StatelessWidget {
  final dateFormat = DateFormat('y');
  final VoidCallback favoritoCallBack;
  final FilmeModel filmeModel;
  FilmesCard(
      {Key? key, required this.filmeModel, required this.favoritoCallBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/filme/detalhe', arguments: filmeModel.id);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: 148,
        height: 280,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w200${filmeModel.caminhoImagemPoster}',
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  filmeModel.titulo,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  dateFormat.format(
                    DateTime.parse(filmeModel.dataLancamento),
                  ),
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ],
            ),
            Positioned(
              bottom: 70,
              right: -3,
              child: Material(
                elevation: 5,
                shape: CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 30,
                  child: IconButton(
                    iconSize: 13,
                    onPressed: favoritoCallBack,
                    icon: Icon(FilmesAppIcons.heart_empty, color: Colors.grey),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
