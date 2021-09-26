import 'package:app_filmes/applications/ui/theme_extension.dart';
import 'package:app_filmes/models/filme_detalhe_modelo.dart';
import 'package:app_filmes/modules/filme_detalhe/widgets/filme_detalhe_conteudo/filme_elenco.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilmeDetalheConteudoElenco extends StatelessWidget {
  final FilmeDetalheModelo? filmeDetalheModelo;
  final showPanel = false.obs;

  FilmeDetalheConteudoElenco({Key? key, required this.filmeDetalheModelo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGrey,
        ),
        ExpansionPanelList(
          elevation: 0,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (panelIndex, isExpanded) {
            showPanel.toggle();
          },
          children: [
            ExpansionPanel(
              canTapOnHeader: false,
              isExpanded: true,
              backgroundColor: Colors.white,
              headerBuilder: (context, isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Elenco',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
              body: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: filmeDetalheModelo?.elencos
                          .map(
                            (el) => FilmeElenco(elencoModelo: el),
                          )
                          .toList() ??
                      const [],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
