import 'package:flutter/material.dart';
import 'package:flutter_app_formulario_validacao_produtos/models/product.dart';
import 'package:flutter_app_formulario_validacao_produtos/screens/add_product/add_product_screen.dart';
import 'package:flutter_app_formulario_validacao_produtos/theme/app_theme.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Product> _products = Product.generateProducts();

  Future<void> _openAddProductScreen() async {
    final newProduct = await Navigator.push<Product>(
      context,
      MaterialPageRoute(builder: (context) => const AddProductScreen()),
    );

    if (newProduct != null) {
      setState(() {
        _products.add(newProduct);
      });
    }
  }

  void _addToCart(Product product) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text('${product.name} foi adicionado ao carrinho!'),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Produtos')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _products.length,
        separatorBuilder: (context, index) =>
            const Divider(color: Colors.grey, thickness: 1),
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            elevation: 2,
            child: ListTile(
              leading: Icon(
                product.icon,
                color: Theme.of(context).colorScheme.primary,
                size: 32,
              ),
              title: Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Preço: R\$ ${product.price.toStringAsFixed(2)}'),
              trailing: ElevatedButton(
                onPressed: () => _addToCart(product),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: const Text('Comprar'),
              ),
              onTap: () => _addToCart(product),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddProductScreen,
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.navy,
        child: const Icon(Icons.add),
      ),
    );
  }
}
