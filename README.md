# Coffee Master ☕

A Flutter mobile application for browsing and ordering coffee products. This is a practice project demonstrating core Flutter concepts including state management, API integration, and navigation.

## Features

- **Browse Menu**: View coffee products organized by categories fetched from a remote API
- **Special Offers**: Display promotional offers and discounts
- **Shopping Cart**: Add products to cart with quantity management
- **Order Management**: Review cart items, remove products, and place orders
- **Responsive UI**: Clean Material Design interface with brown coffee-themed styling

## Screenshots

The app includes three main pages accessible via bottom navigation:
- Menu page with product listings and images
- Offers page with current promotions
- Orders page showing cart items and checkout

## Technical Stack

- **Framework**: Flutter SDK 3.10.4+
- **Language**: Dart
- **State Management**: StatefulWidget with setState
- **HTTP Client**: http package for API calls
- **Data Parsing**: JSON serialization

## Project Structure

```
lib/
├── main.dart              # App entry point and navigation
├── datamanager.dart       # Data management and business logic
├── datamdel.dart          # Data models (Product, Category, ItemInCart)
└── pages/
    ├── menupage.dart      # Product catalog page
    ├── offerspage.dart    # Promotions page
    └── orderspage.dart    # Shopping cart and checkout
```

## Data Models

### Product
- ID, name, price, and image URL
- Fetched from remote API

### Category
- Groups products by type (e.g., Coffee, Tea, Pastries)

### ItemInCart
- Combines product with quantity for cart management

## API Integration

The app fetches menu data from:
```
https://firtman.github.io/coffeemasters/api/menu.json
```

Product images are loaded dynamically from the same API endpoint.

## Key Functionality

### Data Manager
- `fetchMenu()`: Retrieves product catalog from API
- `cardAdd()`: Adds products to cart (increments quantity if already exists)
- `cardDelete()`: Removes items from cart
- `cartClear()`: Empties the entire cart
- `totalCartPrice()`: Calculates total order value

### Order Flow
1. Browse products in the Menu page
2. Add items to cart
3. Navigate to Orders page to review
4. Adjust quantities or remove items
5. Complete order with confirmation dialog
6. Cart automatically clears after order submission

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd coffe_master
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Requirements

- Flutter SDK 3.10.4 or higher
- Dart SDK (included with Flutter)
- Android Studio / Xcode for mobile emulators (or physical device)

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^latest_version
```

## Platform Support

This project supports:
- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Linux
- ✅ Windows

## Future Enhancements

- User authentication
- Order history
- Payment integration
- Product favorites
- Search functionality
- Product filtering and sorting
- Persistent cart storage

## Contributing

This is a practice project. Feel free to fork and experiment with additional features!

## License

This project is for educational purposes. Completed Course From 
https://frontendmasters.com/courses/flutter/
Document : https://firtman.github.io/intro-flutter/
---

Built with Ngen Chanheng (SMUEK) ;(
