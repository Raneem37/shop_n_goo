import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'package:shop_n_goo/Tabs/Home/Thank_u.dart';

class SummaryOrderPage extends StatefulWidget {
  static const String routeName = "Summary" ;
  @override
  State<SummaryOrderPage> createState() => _SummaryOrderPageState();
}

class _SummaryOrderPageState extends State<SummaryOrderPage> {
  final List<CartItem> cartItems = [
    CartItem(name: 'Molto XXL', price: 10.00, image: 'assets/images/Molto.png', quantity: 1),
    CartItem(name: 'Lay\'s classic', price: 15.00, image: 'assets/images/lays.png', quantity: 1),
  ];

  bool rememberCard = false;



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double subtotal = cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
    double discount = 0;
    double total = subtotal - discount;

    Widget buildSection(String title, Widget content) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
        padding: EdgeInsets.all(size.width * 0.04),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: GoogleFonts.schibstedGrotesk(
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkGreen,
                )),
            SizedBox(height: 10),
            content,
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppTheme.Bg,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppTheme.darkGreen),
            onPressed: () => Navigator.pop(context)),
        title: Text("Summary Order",
            style: GoogleFonts.schibstedGrotesk(
                fontSize: size.width * 0.055,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkGreen)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          children: [
            // Product Details
            buildSection(
              "Product Details",
              Column(
                children: [
                  ...cartItems.map((item) {
                    return Row(
                      children: [
                        Image.asset(item.image,
                            width: size.width * 0.15,
                            height: size.width * 0.15,
                            fit: BoxFit.contain),
                        SizedBox(width: size.width * 0.03),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.name,
                                  style: TextStyle(fontWeight: FontWeight.w500)),
                              Text('1 x ${item.price.toStringAsFixed(2)}LE'),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                  Divider(thickness: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total Orders: ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${subtotal.toStringAsFixed(2)}LE"),
                    ],
                  )
                ],
              ),
            ),

            // Payment Method with Card Input
            buildSection(
              "Payment Method",
              Column(
                children: [
                  TextField(

                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Card Number"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(

                          decoration: InputDecoration(labelText: "Expiry Date"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextField(

                          obscureText: true,
                          decoration: InputDecoration(labelText: "CVV"),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: rememberCard,
                        onChanged: (value) {
                          setState(() {
                            rememberCard = value!;
                          });
                        },
                      ),
                      Text("Remember this card"),
                    ],
                  ),
                ],
              ),
            ),

            // Order Details
            buildSection(
              "Order Details",
              Column(
                children: [
                  rowSummary("Subtotal", subtotal),
                  rowSummary("Discount", discount),
                  Divider(thickness: 1),
                  rowSummary("Total Payment", total, isBold: true),
                ],
              ),
            ),

            // Pay Now Button
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, ThankU.routeName,(route)=>false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.darkGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Pay Now",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget rowSummary(String label, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text("${value.toStringAsFixed(2)}LE",
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  final String image;
  final int quantity;

  CartItem({required this.name, required this.price, required this.image, required this.quantity});
}
