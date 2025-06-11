import 'package:flutter/material.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'package:shop_n_goo/Tabs/Home/Cart_Page.dart';
import 'package:shop_n_goo/Tabs/Home/Personal_offers.dart';

class Hometab extends StatelessWidget {
  static const String routeName = "homeTab";

  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.Bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                      Icons.location_on_outlined, color: AppTheme.darkGreen),
                  const SizedBox(width: 8),
                  Container(
                    color: AppTheme.Bg,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('cairo'),
                        Text('korniesh El Niel, Maadi, 13'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    child: Stack(
                      children: [
                        const Icon(Icons.shopping_cart_outlined, size: 28),
                        Positioned(
                          right: 0,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.green,
                            child: const Text(
                              '2',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
              const SizedBox(height: 32),
              const Text('Hello,', style: TextStyle(fontSize: 24)),
              const Text('Raneem', style: TextStyle(fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3D4A1E))),
              const SizedBox(height: 32),
              buildButton(
                Icons.shopping_bag_outlined,
                "Start shopping",
                    () {
                  Navigator.pushNamed(context, CartPage.routeName);
                },
              ),
              const SizedBox(height: 16),
              buildButton(Icons.card_giftcard, "Personal offers" ,
                      ()
                  {Navigator.pushNamed(context, PersonalOffers.routeName);}),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(IconData icon, String text, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F0DC), // Light green background
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.lightGreen),
        title: Text(
          text,
          style: const TextStyle(color: Color(0xFF3D4A1E)),
        ),
        onTap: onPressed, // Use the passed function
      ),
    );
  }
}
