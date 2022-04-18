
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Center(
              child: Column(
                children:  const [
                  SizedBox(
                    height: 500,
                    width: 500,
                    child: Image(
                       image: AssetImage("./assets/img/qrcode.png"),
                    ),
                  ),
                  Text('Scanner by Lisanny A. Peña G.', style:TextStyle(fontStyle: FontStyle.italic),),
                ],
              )
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, 'scanner')
        },
        tooltip: 'Show Camera',
        child: const Icon(Icons.photo_camera_rounded),
        autofocus: true,
      ),
    );
  }
}
