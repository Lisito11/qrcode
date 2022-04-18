import 'package:flutter/material.dart';
import 'package:qrcode/src/screens/scanner_screen.dart';
import 'package:qrcode/src/widgets/qrscanner_widget.dart';
import 'src/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "scanner": (context) =>  QrScannerWidget(),
        "result": (context) =>  ScannerScreen(),
      },
    );
  }
}
