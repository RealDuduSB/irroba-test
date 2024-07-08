import 'package:flutter/material.dart';

/// Um widget de exibição para quando nenhum dado é encontrado.
class NoDataDisplay extends StatelessWidget {
  /// Construtor padrão.
  const NoDataDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Nenhum dado encontrado'),
    );
  }
}
