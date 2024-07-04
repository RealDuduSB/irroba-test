import 'package:flutter/material.dart';

class StatusIdField extends StatelessWidget {
  final Function(String?) onChanged;

  const StatusIdField({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Novo ID de Status'),
      onChanged: onChanged,
    );
  }
}

class CommentField extends StatelessWidget {
  final Function(String) onChanged;

  const CommentField({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Comentário'),
      onChanged: onChanged,
    );
  }
}

class CodeTrackingField extends StatelessWidget {
  final Function(String) onChanged;

  const CodeTrackingField({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(labelText: 'Código de Rastreio'),
      onChanged: onChanged,
    );
  }
}

class UpdateStatusButton extends StatelessWidget {
  final Function onPressed;

  const UpdateStatusButton({Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      child: const Text('Atualizar Status'),
    );
  }
}
