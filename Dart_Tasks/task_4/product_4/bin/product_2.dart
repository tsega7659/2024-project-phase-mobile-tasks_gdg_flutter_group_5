import 'dart:io';
import 'package:product_2/product_manager.dart';
import 'package:product_2/product.dart';

void main() {
  var productManager = ProductManager();

  while (true) {
    // Display menu options
    print('\n\n--- Welcome to Yeab eCommerce Application ---\n\n\n');
    print('1. Add a Product');
    print('2. View All Products');
    print('3. View a Single Product');
    print('4. Edit a Product');
    print('5. Delete a Product');
    print('6. Exit');
    stdout.write('Enter your choice: ');

    // Read user input
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1': // Add a Product
        stdout.write('Enter product name: ');
        var name = stdin.readLineSync()!;
        stdout.write('Enter product description: ');
        var description = stdin.readLineSync()!;
        stdout.write('Enter product price: ');
        var price = double.parse(stdin.readLineSync()!);

        var product = Product(name: name, description: description, price: price);
        productManager.addProduct(product);
        break;

      case '2': // View All Products
        productManager.viewAllProducts();
        break;

      case '3': // View a Single Product
        stdout.write('Enter the product name to view: ');
        var name = stdin.readLineSync()!;
        productManager.viewSingleProduct(name);
        break;

      case '4': // Edit a Product
        stdout.write('Enter the product name to edit: ');
        var name = stdin.readLineSync()!;
        stdout.write('Enter new product name: ');
        var newName = stdin.readLineSync()!;
        stdout.write('Enter new product description: ');
        var newDescription = stdin.readLineSync()!;
        stdout.write('Enter new product price: ');
        var newPrice = double.parse(stdin.readLineSync()!);

        productManager.editProduct(name, newName, newDescription, newPrice);
        break;

      case '5': // Delete a Product
        stdout.write('Enter the product name to delete: ');
        var name = stdin.readLineSync()!;
        productManager.deleteProduct(name);
        break;

      case '6': // Exit
        print('Exiting the application. Goodbye!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}