import 'package:flutter/material.dart';
import 'package:valdeglace/product.dart';
import 'package:simple_coverflow/simple_coverflow.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

void main() => runApp(MaterialApp(
      title: 'Valdeglace Chocolates',
      theme: ThemeData(primarySwatch: Colors.indigo),
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
    final ThemeData theme = Theme.of(context);
    var products = widget.allProducts;
    return CoverFlow(
        dismissibleItems: false,
        itemBuilder: (_, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 4 / 3,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: products[index].defaultImage,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          products[index].name,
                          style: theme.textTheme.title,
                        ),
                        Text(
                          products[index].description,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildButtonColumn(Icons.call, 'LIGAR',
                                () => _launchURL("tel:943995279")),
                            buildButtonColumn(Icons.message, 'MENSAGEM',
                                () => _launchURL("tel:943995279")),
                            buildButtonColumn(Icons.share, 'COMPARTILHAR',
                                () => share('Gostei da ${products[index].name} no aplicativo da Valdeglace Chocolates.')),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: products.length);
  }

  Widget buildButtonColumn(IconData icon, String label, Function function) {
    Color color = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: function,
      child: new Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    print("clicou $url");
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
