# Grocery App with BLoC State Management

This is a simple Flutter application that demonstrates the use of the BLoC (Business Logic Component) state management pattern. The app simulates a grocery application with features like product listing, a wishlist, and a shopping cart. Users can add items to their wishlist and shopping cart and remove them as needed.

## Features

- Product Listing: View a list of available grocery items with details such as name, price, and description.

- Wishlist: Add items to your wishlist for future reference.

- Shopping Cart: Add items to your shopping cart and manage your purchases.

- Remove Items: Remove items from both the wishlist and the shopping cart.

## Prerequisites

To run this application, you need:

- [Flutter](https://flutter.dev/) installed on your development machine.

## Getting Started

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/Sajidpv/BLoC-Grocery-app.git
   
Navigate to the project directory:

bash

cd grocery-app-bloc
Install dependencies:

bash

flutter pub get
Run the app:

bash

flutter run
Project Structure
The project structure is organized as follows:

lib/ contains the Dart source code for the application.
assets/ contains the asset files of the project.
data/ contains the static/dummy data for the project.
features/ contains the data models for products.
  cart/ contains the files related to cart.
     bloc/ contains the bloc files related to cart.
      ui/ contains the ui files related to cart.
  home/ contains the files related to home.
     bloc/ contains the bloc files related to cart.
      ui/ contains the ui files related to cart.
  wishlist/ contains files related to wishlist.
     bloc/ contains bloc the files related to cart.
      ui/ contains the ui files related to cart.

globals/ contains the global styles using by the app.

State Management with BLoC

The BLoC pattern is used to manage the application's state. There are separate BLoC classes for managing the state of the product listing, wishlist, and shopping cart. Actions such as adding and removing items are handled by the BLoC components.

Screenshots

Product Listing
![Screenshot_1699245595](https://github.com/Sajidpv/BLoC-Grocery-app/assets/125041012/f4f9b85f-fc6c-4130-89b6-f1fdaff063a7)

Wishlist
![Screenshot_1699245633](https://github.com/Sajidpv/BLoC-Grocery-app/assets/125041012/852c05cb-0387-496c-98ad-848e6813f08c)

Shopping Cart
![Screenshot_1699245621](https://github.com/Sajidpv/BLoC-Grocery-app/assets/125041012/48ffdd45-94c0-4b73-97d4-9c6fec2f4dcf)

Contributing
Feel free to contribute to this project. You can submit bug reports, feature requests, or even pull requests.

License
This project is licensed under the MIT License. See the LICENSE file for details.






