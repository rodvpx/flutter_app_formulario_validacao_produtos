import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String category;

  Product({required this.name, required this.price, required this.category});

  IconData get icon {
    switch (category) {
      case 'Eletrônicos':
        return Icons.devices;
      case 'Vestuário':
        return Icons.checkroom;
      case 'Livros':
        return Icons.book;
      case 'Relógio':
        return Icons.watch;
      case 'Sacola':
      default:
        return Icons.shopping_bag;
    }
  }

  static List<Product> generateProducts() {
    return [
      Product(name: 'Notebook Gamer', price: 5500.00, category: 'Eletrônicos'),
      Product(name: 'Smartphone Pro', price: 4500.00, category: 'Eletrônicos'),
      Product(
        name: 'Fone de Ouvido sem Fio',
        price: 250.00,
        category: 'Eletrônicos',
      ),
    ];
  }
}
