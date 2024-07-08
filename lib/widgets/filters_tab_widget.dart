import 'package:flutter/material.dart';

/// Um widget de aba de filtros que exibe um texto centralizado.
class FiltersTab extends StatelessWidget {
  /// Construtor padrão.
  const FiltersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Aba de Filtros'),
    );
  }
}
