import 'package:app_filmes/modules/filme_detalhe/filme_detalhe_controller.dart';
import 'package:app_filmes/modules/filme_detalhe/widgets/filme_detalhe_conteudo/filme_detalhe_conteudo.dart';
import 'package:app_filmes/modules/filme_detalhe/widgets/filme_detalhe_conteudo/filme_detalhe_conteudo_companhia_produtora.dart';
import 'package:app_filmes/modules/filme_detalhe/widgets/filme_detalhe_conteudo/filme_detalhe_conteudo_creditos.dart';
import 'package:app_filmes/modules/filme_detalhe/widgets/filme_detalhe_conteudo/filme_detalhe_conteudo_elenco.dart';
import 'package:app_filmes/modules/filme_detalhe/widgets/filme_detalhe_conteudo/filme_detalhe_header.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FilmeDetalhePage extends GetView<FilmeDetalheController> {
  const FilmeDetalhePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FilmeDetalheHeader(filmeDetalhe: controller.filmeDetalhe.value),
                FilmeDetalheConteudo(
                    filmeDetalhe: controller.filmeDetalhe.value),
                FilmeDetalheConteudoCreditos(
                    filmeDetalhe: controller.filmeDetalhe.value),
                FilmeDetalheConteudoCompanhiaProdutora(
                    filmeDetalhe: controller.filmeDetalhe.value),
                FilmeDetalheConteudoElenco(
                    filmeDetalheModelo: controller.filmeDetalhe.value),
              ],
            );
          },
        ),
      ),
    );
  }
}
