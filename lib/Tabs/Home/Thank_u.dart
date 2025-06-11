import 'package:flutter/material.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'package:shop_n_goo/Tabs/Home/HomeTab.dart';
import 'package:shop_n_goo/Tabs/Home/Home_Screen.dart';
import 'package:shop_n_goo/Tabs/Home/View_order_Summary.dart';

class ThankU extends StatelessWidget {
  static const String routeName = "ThankU" ;

  const ThankU({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      backgroundColor: AppTheme.Bg,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Thank You!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkGreen)),
            SizedBox(height: 60),
            Image.asset('assets/images/Thanku.png', width: width * 0.5),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {Navigator.pushNamed(context, ViewOrderSummary.routeName);},
                child: Text("View Order" , style: TextStyle(color: AppTheme.white),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.darkGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {Navigator.pushReplacementNamed(context, HomeScreen.routeName);},
                child: Text("Back to Home"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.darkGreen,
                  side: BorderSide(color: AppTheme.darkGreen,),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}