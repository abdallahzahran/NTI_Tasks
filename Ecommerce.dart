import 'dart:io';

void main() {
  Ecommerce ecommerce = Ecommerce(name: 'Shop1', products: []);

  while (true) {
    print('\n----------- Ecommerce -----------');
    print("1 - Show Menu");
    print("2 - Add Product");
    print("3 - Edit Product");
    print("4 - Buy Product");
    print("5 - Sell Product");
    print("6 - Exit");
    print('---------------------------------');
    stdout.write("Choice => ");

    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        ecommerce.showMenu();
        break;
      case '2':
        ecommerce.addProduct();
        break;
      case '3':
        ecommerce.editProduct();
        break;
      case '4':
        ecommerce.buy();
        break;
      case '5':
        ecommerce.sell();
        break;
      case '6':
        print("Exiting program... Goodbye!");
        exit(0);
      default:
        print("Invalid choice. Try again.");
    }
  }
}

class Product {
  late String name;
  late String category;
  late double price;
  late int quantity;

  Product({
    required this.name,
    required this.category,
    required double price,
    required int quantity,
  }) {
    this.price = price > 0 ? price : 0;
    this.quantity = quantity > 0 ? quantity : 0;
  }
}

class Ecommerce {
  late String name;
  late List<Product> _products;

  Ecommerce({required this.name, required List<Product> products}) {
    _products = products;
  }

  void showMenu() {
    if (_products.isEmpty) {
      print("No products available.");
    } else {
      print("Products in store:");
      int index = 1;
      for (var product in _products) {
        print(
          "$index - Name: ${product.name}, Category: ${product.category}, Price: ${product.price}, Quantity: ${product.quantity}",
        );
        index++;
      }
    }
  }

  void addProduct() {
    stdout.write("Enter product name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Enter product category: ");
    String category = stdin.readLineSync()!;

    stdout.write("Enter product price: ");
    double price = double.parse(stdin.readLineSync()!);

    stdout.write("Enter product quantity: ");
    int quantity = int.parse(stdin.readLineSync()!);

    Product newProduct = Product(
      name: name,
      category: category,
      price: price,
      quantity: quantity,
    );

    _products.add(newProduct);
    print("Product added successfully!");
  }

  void editProduct() {
    showMenu();
    if (_products.isEmpty) return;

    stdout.write("Enter product number to edit: ");
    int index = int.parse(stdin.readLineSync()!) - 1;

    if (index < 0 || index >= _products.length) {
      print("Invalid index.");
      return;
    }

    Product selected = _products[index];

    stdout.write("New name (${selected.name}): ");
    String newName = stdin.readLineSync()!;
    if (newName.isNotEmpty) selected.name = newName;

    stdout.write("New category (${selected.category}): ");
    String newCategory = stdin.readLineSync()!;
    if (newCategory.isNotEmpty) selected.category = newCategory;

    stdout.write("New price (${selected.price}): ");
    String priceInput = stdin.readLineSync()!;
    if (priceInput.isNotEmpty) selected.price = double.parse(priceInput);

    stdout.write("New quantity (${selected.quantity}): ");
    String quantityInput = stdin.readLineSync()!;
    if (quantityInput.isNotEmpty) selected.quantity = int.parse(quantityInput);

    print("Product updated successfully.");
  }

  void buy() {
    showMenu();
    if (_products.isEmpty) return;

    stdout.write("Enter product number to buy: ");
    int index = int.parse(stdin.readLineSync()!) - 1;

    if (index < 0 || index >= _products.length) {
      print("Invalid product number.");
      return;
    }

    stdout.write("Enter quantity to buy: ");
    int qty = int.parse(stdin.readLineSync()!);

    _products[index].quantity += qty;
    print("Stock updated successfully.");
  }

  void sell() {
    showMenu();
    if (_products.isEmpty) return;

    stdout.write("Enter product number to sell: ");
    int index = int.parse(stdin.readLineSync()!) - 1;

    if (index < 0 || index >= _products.length) {
      print("Invalid product number.");
      return;
    }

    stdout.write("Enter quantity to sell: ");
    int qty = int.parse(stdin.readLineSync()!);

    if (qty > _products[index].quantity) {
      print("Not enough stock.");
      return;
    }

    _products[index].quantity -= qty;
    print("Sale completed. Remaining quantity: ${_products[index].quantity}");
  }
}
