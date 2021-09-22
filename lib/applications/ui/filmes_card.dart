import 'package:app_filmes/applications/ui/filmes_app_icons.dart';
import 'package:flutter/material.dart';

class FilmesCard extends StatelessWidget {
  const FilmesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      'https://images-eu.ssl-images-amazon.com/images/I/51Qma1Xm19L._SY291_BO1,204,203,200_QL40_ML2_.jpg',
                      width: 148,
                      height: 184,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Black Widow',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                '2021',
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
                  onPressed: () {},
                  icon: Icon(FilmesAppIcons.heart_empty, color: Colors.grey),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
