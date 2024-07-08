import 'package:flutter/material.dart';

/// Campo de ID do Status para atualização de pedidos.
class StatusIdField extends StatelessWidget {
  final ValueChanged<String?> onChanged;

  const StatusIdField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'ID do Status'),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}

/// Campo de Comentário para atualização de pedidos.
class CommentField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CommentField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Comentário'),
      onChanged: onChanged,
    );
  }
}

/// Campo de Código de Rastreamento para atualização de pedidos.
class CodeTrackingField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CodeTrackingField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Código de Rastreamento'),
      onChanged: onChanged,
    );
  }
}

/// Botão para atualizar o status do pedido.
class UpdateStatusButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UpdateStatusButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Atualizar Status'),
    );
  }
}
