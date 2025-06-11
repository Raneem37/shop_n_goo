import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:shop_n_goo/Tabs/Home/Cart_Page.dart';
import 'package:shop_n_goo/Tabs/Home/HomeTab.dart';
import 'package:shop_n_goo/Tabs/Home/Home_Screen.dart';
import 'package:shop_n_goo/Tabs/Home/Personal_offers.dart';
import 'package:shop_n_goo/Tabs/Home/Summary_order.dart';
import 'package:shop_n_goo/Tabs/Home/Thank_u.dart';
import 'package:shop_n_goo/Tabs/Home/View_order_Summary.dart';
import 'package:shop_n_goo/Tabs/Scanner/ScannerTab.dart';
import 'package:shop_n_goo/Tabs/Settings/ProfileTab.dart';
import 'package:shop_n_goo/AppTheme.dart';
import 'package:shop_n_goo/First_Screen.dart';
import 'package:shop_n_goo/UserInfo/SignIn.dart';
import 'package:shop_n_goo/UserInfo/signUp.dart';
import 'Tabs/Settings/About_us.dart';
import 'Tabs/Settings/Edit_Profile.dart';
import 'Tabs/Settings/Privacy_policy.dart';
import 'Tabs/Settings/SettingsProvider.dart';
import 'Tabs/Scanner/ScannerTab.dart';




void main () {
  runApp(ChangeNotifierProvider(
      create: (_)=>SettingProvider(),
      child: ShopNGo()));
}

class ShopNGo extends StatelessWidget {
  const ShopNGo({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // Black icons
        statusBarColor: Colors.transparent, // Transparent status bar
      ),);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        FirstScreen.routeName: (_) => FirstScreen() ,
        signUp.routeName :(_) => signUp(),
        signIn.routeName :(_) => signIn(),
        EditProfile.routeName :(_) => EditProfile(),
        AboutUs.routeName :(_) => AboutUs(),
        PrivacyPolicy.routeName :(_) => PrivacyPolicy(),
        Profiletab.routeName :(_) => Profiletab(),
        SummaryOrderPage.routeName :(_) => SummaryOrderPage(),
        ThankU.routeName :(_) => ThankU(),
        Hometab.routeName :(_) => Hometab(),
        HomeScreen.routeName :(_) => HomeScreen(),
        ViewOrderSummary.routeName :(_) => ViewOrderSummary(),
        CartPage.routeName :(_) => CartPage() ,
        PersonalOffers.routeName :(_) => PersonalOffers(),
        // Scannertab.routeName :(_) =>Scannertab(),

      } ,
      initialRoute:FirstScreen .routeName ,
      theme: ThemeData(
        scaffoldBackgroundColor: AppTheme.Bg,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light, // For iOS: (dark icons)
            statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)

          ),
        ),
      ),

    );
  }
}
