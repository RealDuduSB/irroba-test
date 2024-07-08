import 'package:flutter/material.dart';
import 'package:irroba_test/provider/product_provider.dart';
import 'package:irroba_test/widgets/products_widgets.dart';
import 'package:provider/provider.dart';

/// Tela para cadastrar um novo produto.
class ProductRegistrationScreen extends StatefulWidget {
  const ProductRegistrationScreen({Key? key}) : super(key: key);

  @override
  _ProductRegistrationScreenState createState() =>
      _ProductRegistrationScreenState();
}

class _ProductRegistrationScreenState extends State<ProductRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _categoryIdController = TextEditingController();
  final _priceController = TextEditingController();
  final _stockController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _categoryIdController.dispose();
    _priceController.dispose();
    _stockController.dispose();
    super.dispose();
  }

  /// Submete o formulário de cadastro do produto.
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final productProvider =
          Provider.of<ProductProvider>(context, listen: false);
      productProvider
          .addProduct(
        name: _nameController.text,
        categoryId: int.parse(_categoryIdController.text),
        price: double.parse(_priceController.text),
        stock: int.parse(_stockController.text),
      )
          .then((success) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Produto cadastrado com sucesso!')),
          );
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Erro ao cadastrar produto.')),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ProductNameField(controller: _nameController),
              CategoryIdField(controller: _categoryIdController),
              PriceField(controller: _priceController),
              StockField(controller: _stockController),
              const SizedBox(height: 20),
              SubmitButton(onPressed: _submitForm),
            ],
          ),
        ),
      ),
    );
  }
}
