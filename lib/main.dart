import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QRViewExample(),
    );
  }
}

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  MobileScannerController controller = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('QR Scanner Example'),
        ),
        body: MobileScanner(
          controller: controller,
          onDetect: (barcode) {
            final String code = barcode.raw.toString();
            debugPrint('Barcode found! $code');
            if (code.isNotEmpty) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: Text('Barcode found! $code'),
                ),
              );
            }
          },
        ));
  }
}
