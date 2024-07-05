// lib/widgets/order_status_widgets.dart

import 'package:flutter/material.dart';

class StatusIdField extends StatelessWidget {
  final ValueChanged<String?> onChanged;

  const StatusIdField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'ID do Status'),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
    );
  }
}

class CommentField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CommentField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Comentário'),
      onChanged: onChanged,
    );
  }
}

class CodeTrackingField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CodeTrackingField({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Código de Rastreamento'),
      onChanged: onChanged,
    );
  }
}

class UpdateStatusButton extends StatelessWidget {
  final VoidCallback onPressed;

  const UpdateStatusButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Atualizar Status'),
    );
  }
}
