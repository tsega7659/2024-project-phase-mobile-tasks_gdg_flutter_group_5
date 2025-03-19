class Product {
  final int id;
  String name;
  String description;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  String toString() {
    return 'Product(ID: $id, Name: $name, Description: $description, Price: \$${price.toStringAsFixed(2)})';
  }
}
