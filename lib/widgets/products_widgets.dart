import 'package:flutter/material.dart';

class ProductNameField extends StatelessWidget {
  final TextEditingController controller;

  const ProductNameField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Nome do Produto'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o nome do produto';
        }
        return null;
      },
    );
  }
}

class CategoryIdField extends StatelessWidget {
  final TextEditingController controller;

  const CategoryIdField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'ID da Categoria'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o ID da categoria';
        }
        return null;
      },
    );
  }
}

class PriceField extends StatelessWidget {
  final TextEditingController controller;

  const PriceField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Preço'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o preço';
        }
        return null;
      },
    );
  }
}

class StockField extends StatelessWidget {
  final TextEditingController controller;

  const StockField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(labelText: 'Estoque'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira a quantidade em estoque';
        }
        return null;
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('Cadastrar Produto'),
    );
  }
}
