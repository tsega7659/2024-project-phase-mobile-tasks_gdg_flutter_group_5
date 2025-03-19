import 'product.dart';
import 'product_repository.dart';

class ViewAllProductsUseCase {
  final ProductRepository repository;
  ViewAllProductsUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}

class ViewProductUseCase {
  final ProductRepository repository;
  ViewProductUseCase(this.repository);

  Future<Product?> call(int id) async {
    return await repository.getProductById(id);
  }
}

class CreateProductUseCase {
  final ProductRepository repository;
  CreateProductUseCase(this.repository);

  Future<void> call(Product product) async {
    await repository.addProduct(product);
  }
}

class UpdateProductUseCase {
  final ProductRepository repository;
  UpdateProductUseCase(this.repository);

  Future<void> call(Product product) async {
    await repository.updateProduct(product);
  }
}

class DeleteProductUseCase {
  final ProductRepository repository;
  DeleteProductUseCase(this.repository);

  Future<void> call(int id) async {
    await repository.deleteProduct(id);
  }
}
