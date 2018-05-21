import 'package:flutter/material.dart';
import 'package:valdeglace/product.dart';
import 'package:valdeglace/product_cover_flow.dart';

void main() => runApp(MaterialApp(
      title: 'Valdeglace Chocolates',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProductsPage(getProducts());
  }

  List<Product> getProducts() => [
        Product(1, 'Cesta Pequena', 'Contém 1 coração pequeno e 2 trufas.'),
        Product(2, 'Cesta Média', 'Contém 1 coração médio e 3 trufas'),
        Product(3, 'Cesta Grande', 'Contém 1 coração grande e 4 trufas'),
        Product(4, 'Cesta Família', 'Contém 2 corações grandes e 6 trufas'),
      ];
}

class ProductsPage extends StatefulWidget {
  final List<Product> allProducts;

  ProductsPage(this.allProducts);

  @override
  _ProductsPageState createState() => new _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Valdeglace Chocolates'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              title: Text('Available'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('Reserved'), icon: Icon(Icons.shopping_basket)),
        ],
      ),
      body: Container(
        color: Colors.brown[900],
        child: ProductCoverFlow(widget.allProducts),
      ),
    );
  }
}
