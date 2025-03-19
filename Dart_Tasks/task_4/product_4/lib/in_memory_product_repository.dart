import 'product.dart';
import 'product_repository.dart';

class InMemoryProductRepository implements ProductRepository {
  final List<Product> _products = [];
  int _nextId = 1;

  @override
  Future<List<Product>> getAllProducts() async {
    return _products;
  }

  @override
  Future<Product?> getProductById(int id) async {
    return _products.firstWhere((product) => product.id == id, orElse: () => null);
  }

  @override
  Future<void> addProduct(Product product) async {
    _products.add(Product(
      id: _nextId++,
      name: product.name,
      description: product.description,
      price: product.price,
    ));
  }

  @override
  Future<void> updateProduct(Product product) async {
    final index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    _products.removeWhere((product) => product.id == id);
  }
}
