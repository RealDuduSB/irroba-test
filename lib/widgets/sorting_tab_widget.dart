import 'package:flutter/material.dart';

/// O widget [SortingTab] exibe uma mensagem de texto simples centralizada na tela.
/// Este widget é destinado a ser usado como uma aba para opções de ordenação no aplicativo.
class SortingTab extends StatelessWidget {
  /// Cria um widget [SortingTab].
  const SortingTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      // Centraliza o widget filho (Text) no meio da tela.
      child: Text('Aba de Ordenações'), // Exibe uma mensagem de texto.
    );
  }
}
