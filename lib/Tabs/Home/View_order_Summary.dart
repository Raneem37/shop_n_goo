import 'package:flutter/material.dart';

class ViewOrderSummary extends StatelessWidget {
  static const String routeName = "ViewSummary" ;
  const ViewOrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green[900]),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
        ),
        title: Text("Order Summary",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green[900])),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            // Order ID Box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order ID - NEGH10075",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text("on Sep 29, 2024 · 06:47 pm",
                      style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Order Details Box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Item value (2 items)"), Text("25.00LE")],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Discount"), Text("0.00LE")],
                  ),
                  Divider(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Orders",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("25.00LE",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Payment Box
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Visa **** 8600"), Text("25.00LE")],
              ),
            ),
            SizedBox(height: 16),

            // Product Details
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  buildProductRow(
                      "Molto XXL", "15.00LE", "assets/images/Molto.png"),
                  SizedBox(height: 12),
                  buildProductRow(
                      "Lay’s Classic", "10.00LE", "assets/images/lays.png"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductRow(String title, String price, String imagePath) {
    return Row(
      children: [
        Image.asset(imagePath, height: 40, width: 40),
        SizedBox(width: 12),
        Expanded(child: Text(title)),
        Text(price),
        SizedBox(width: 12),
        Text("1"),
      ],
    );
  }
}