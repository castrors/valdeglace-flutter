import 'package:flutter/material.dart';
import 'package:valdeglace/product.dart';
import 'package:simple_coverflow/simple_coverflow.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class ProductCoverFlow extends StatelessWidget {
  final List<Product> products;

  ProductCoverFlow(this.products);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CoverFlow(
        dismissibleItems: false,
        itemBuilder: (_, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1.0,
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
                            buildButtonColumn(context, Icons.call, 'LIGAR',
                                () => _launchURL("tel:943995279")),
                            buildButtonColumn(context, Icons.message,
                                'MENSAGEM', () => _launchURL("tel:943995279")),
                            buildButtonColumn(
                                context,
                                Icons.share,
                                'COMPARTILHAR',
                                () => share(
                                    'Gostei da ${products[index].name} no aplicativo da Valdeglace Chocolates.')),
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

  Widget buildButtonColumn(
      BuildContext context, IconData icon, String label, Function function) {
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
