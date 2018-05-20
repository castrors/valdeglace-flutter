class Product {
  final int id;
  final String name;
  final String description;
  final String defaultImage =
      'https://firebasestorage.googleapis.com/v0/b/sufficientgoldfish.appspot.com/o/angelfish-silhouette.png?alt=media&token=76663301-d3d5-4c49-a7ea-db1f163d5c06';

  const Product(this.id, this.name, this.description);

  @override
  String toString() => "$name (id=$id)";
}
