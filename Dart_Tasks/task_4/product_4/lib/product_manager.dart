import 'dart:io';
import 'package:product_2/use_casea.dart';

import 'product.dart';
import 'in_memory_product_repository.dart';


void main() async {
  final repository = InMemoryProductRepository();
  final viewAll = ViewAllProductsUseCase(repository);
  final viewProduct = ViewProductUseCase(repository);
  final createProduct = CreateProductUseCase(repository);
  final updateProduct = UpdateProductUseCase(repository);
  final deleteProduct = DeleteProductUseCase(repository);

  while (true) {
    print('\n--- Yeab eCommerce Application ---\n');
    print('1. Add a Product');
    print('2. View All Products');
    print('3. View a Single Product');
    print('4. Edit a Product');
    print('5. Delete a Product');
    print('6. Exit');
    stdout.write('Enter your choice: ');

    var choice = stdin.readLineSync();

    switch (choice) {
      case '1': // Add a Product
        stdout.write('Enter product name: ');
        var name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        var description = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        var price = double.parse(stdin.readLineSync()!);

        await createProduct(Product(id: 0, name: name, description: description, price: price));
        print('Product added successfully.');
        break;

      case '2': // View All Products
        var products = await viewAll();
        if (products.isEmpty) {
          print('No products available.');
        } else {
          products.forEach((product) => print(product));
        }
        break;

      case '3': // View a Single Product
        stdout.write('Enter product ID to view: ');
        var id = int.parse(stdin.readLineSync()!);
        var product = await viewProduct(id);
        product != null ? print(product) : print('Product not found.');
        break;

      case '4': // Edit a Product
        stdout.write('Enter product ID to edit: ');
        var id = int.parse(stdin.readLineSync()!);
        stdout.write('Enter new product name: ');
        var newName = stdin.readLineSync()!;
        stdout.write('Enter new product description: ');
        var newDescription = stdin.readLineSync()!;
        stdout.write('Enter new product price: ');
        var newPrice = double.parse(stdin.readLineSync()!);

        await updateProduct(Product(id: id, name: newName, description: newDescription, price: newPrice));
        print('Product updated successfully.');
        break;

      case '5': // Delete a Product
        stdout.write('Enter product ID to delete: ');
        var id = int.parse(stdin.readLineSync()!);
        await deleteProduct(id);
        print('Product deleted successfully.');
        break;

      case '6': // Exit
        print('Exiting the application. Goodbye!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
