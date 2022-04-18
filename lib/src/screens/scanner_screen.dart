import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qrcode/src/providers/qrcode_provider.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final qrCodeProvider = Get.put(QrCodeProvider());

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: qrCodeProvider.resultCode.value));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(seconds: 1),
      content: Text('Copied to clipboard'),
    ));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () {Navigator.popAndPushNamed(context, '/');},
        ),
        title: const Text('Scanner'),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
              Navigator.popAndPushNamed(context, '/');
              return Future.value(false);
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  IconButton(
                    icon: const Icon(Icons.copy),
                    color: Theme.of(context).primaryColor,
                    onPressed: _copyToClipboard,
                  ),
            Flexible(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    text: qrCodeProvider.resultCode.value),
              ),
            ), // SelectableText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
