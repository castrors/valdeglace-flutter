class Product {
  final int id;
  final String name;
  final String description;
  final String defaultImage =
      'https://scontent.fudi1-2.fna.fbcdn.net/v/t1.0-9/13932804_1413925025290301_8710348734503395959_n.jpg?_nc_cat=0&oh=4eb931124cc4c9a02f901f42e9fc8119&oe=5B8EE36B';

  const Product(this.id, this.name, this.description);

  @override
  String toString() => "$name (id=$id)";
}
