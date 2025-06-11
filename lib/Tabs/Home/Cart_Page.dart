import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'package:shop_n_goo/Tabs/Home/Summary_order.dart';

class CartPage extends StatelessWidget {
  static const String routeName = "cart" ;
  final List<CartItem> cartItems = [
    CartItem(
        name: 'Molto XXL',
        price: 10.00,
        image: 'assets/images/Molto.png',
        quantity: 1),
    CartItem(
        name: 'Lays Classic',
        price: 50.00,
        image: 'assets/images/lays.png',
        quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double subtotal =
    cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

    return Scaffold(
      backgroundColor: AppTheme.Bg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppTheme.darkGreen),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Cart',
          style: GoogleFonts.schibstedGrotesk(
            fontSize: size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: AppTheme.darkGreen,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete, color: AppTheme.darkGreen),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, vertical: size.height * 0.01),
        child: Column(
          children: [
            ...cartItems.map((item) {
              return Container(
                margin: EdgeInsets.only(bottom: size.height * 0.015),
                padding: EdgeInsets.all(size.width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Image.asset(item.image,
                        height: size.width * 0.15,
                        width: size.width * 0.15,
                        fit: BoxFit.contain),
                    SizedBox(width: size.width * 0.04),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.width * 0.045)),
                          SizedBox(height: size.height * 0.005),
                          Text('${item.price.toStringAsFixed(2)}LE',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * 0.04)),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.035,
                          vertical: size.height * 0.01),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        item.quantity.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.045),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),

            // Subtotal and Checkout
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                  vertical: size.height * 0.02),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(size.width * 0.08)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sub_Total",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.045)),
                      Text("${subtotal.toStringAsFixed(2)}LE",
                          style: TextStyle(fontSize: size.width * 0.045)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    width: double.infinity,
                    height: size.height * 0.065,
                    child: ElevatedButton(
                      onPressed: () {Navigator.pushNamed(context, SummaryOrderPage.routeName);},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.darkGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Checkout",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.045)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final String image;
  final int quantity;

  CartItem(
      {required this.name,
        required this.price,
        required this.image,
        required this.quantity});
}
