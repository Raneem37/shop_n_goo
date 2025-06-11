import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:shop_n_goo/AppTheme.dart';

class Scannertab extends StatefulWidget {
  @override
  _ScannertabState createState() => _ScannertabState();
}

class _ScannertabState extends State<Scannertab> {
  String barcode = "Scan a product";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.Bg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Barcode Scanner',
          style: TextStyle(
            color: AppTheme.darkGreen,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.06,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.qr_code_scanner, size: screenWidth * 0.3, color: AppTheme.darkGreen),
              SizedBox(height: screenHeight * 0.04),
              Text(
                'Barcode: $barcode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.darkGreen,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.darkGreen,
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () async {
                    String? res = await SimpleBarcodeScanner.scanBarcode(
                      context,
                      barcodeAppBar: const BarcodeAppBar(
                        appBarTitle: 'Scan Product',
                        centerTitle: true,
                        enableBackButton: true,
                        backButtonIcon: Icon(Icons.arrow_back_ios),
                      ),
                      isShowFlashIcon: true,
                      delayMillis: 500,
                      cameraFace: CameraFace.back,
                      scanFormat: ScanFormat.ONLY_BARCODE,
                    );

                    if (res != null && res != '-1') {
                      setState(() {
                        barcode = res;
                      });
                    }
                  },
                  child: Text(
                    'Scan Barcode',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
//
// class Scannertab extends StatefulWidget {
//   @override
//   _ScannertabState createState() => _ScannertabState();
// }
//
// class _ScannertabState extends State<Scannertab> {
//   String barcode = "Scan a product";
//   String result = '';
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Barcode Scanner'),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Barcode: $barcode',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               // onPressed: scanBarcode,
//               onPressed: () async {
//                 String? res = await SimpleBarcodeScanner.scanBarcode(
//                   context,
//                   barcodeAppBar: const BarcodeAppBar(
//                     appBarTitle: 'Test',
//                     centerTitle: false,
//                     enableBackButton: true,
//                     backButtonIcon: Icon(Icons.arrow_back_ios),
//                   ),
//                   isShowFlashIcon: true,
//                   delayMillis: 500,
//                   cameraFace: CameraFace.back,
//                   scanFormat: ScanFormat.ONLY_BARCODE,
//                 );
//                 result = res as String;
//                 setState(() {
//
//                 });
//               },
//               child: Text('Scan Barcode'),
//             ),
//             // Text('Scan Barcode Result: $result'),
//             // const SizedBox(
//             //   height: 10,
//             // ),
//             // ElevatedButton(
//             //   onPressed: () async {
//             //     SimpleBarcodeScanner.streamBarcode(
//             //       context,
//             //       barcodeAppBar: const BarcodeAppBar(
//             //         appBarTitle: 'Test',
//             //         centerTitle: false,
//             //         enableBackButton: true,
//             //         backButtonIcon: Icon(Icons.arrow_back_ios),
//             //       ),
//             //       isShowFlashIcon: true,
//             //       delayMillis: 2000,
//             //     ).listen((event) {
//             //       print("Stream Barcode Result: $event");
//             //     });
//             //   },
//             //   child: const Text('Stream Barcode'),
//             // ),
//             // const SizedBox(
//             //   height: 10,
//             // ),
//             // ElevatedButton(
//             //     onPressed: () {
//             //       // Navigator.push(context, MaterialPageRoute(builder: (context) {
//             //       //   // return const BarcodeWidgetPage();
//             //       // }));
//             //     },
//             //     child: const Text('Barcode Scanner Widget(Android Only)'))
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Function to scan the barcode
//   Future<void> scanBarcode() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => SimpleBarcodeScanner(onBarcodeViewCreated: (BarcodeViewController controller) {  },),
//       ),
//     );
//
//     if (result != null && result.isNotEmpty) {
//       setState(() {
//         barcode = result; // Set the scanned barcode value
//       });
//     }
//   }
// }
