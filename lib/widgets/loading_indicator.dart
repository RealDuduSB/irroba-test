import 'package:flutter/material.dart';

/// Um indicador de carregamento que exibe um círculo de progresso centralizado.
class LoadingIndicator extends StatelessWidget {
  /// Construtor padrão.
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
