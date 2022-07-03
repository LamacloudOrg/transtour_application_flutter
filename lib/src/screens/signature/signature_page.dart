import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  SignaturePage({Key? key}) : super(key: key);

  @override
  State<SignaturePage> createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  Uint8List? exportedImage;

  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.white,
    exportBackgroundColor: Colors.yellowAccent,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        centerTitle: true,
        title: const Text("Firme su voucher"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Signature(
              controller: controller,
              width: 350,
              height: 200,
              backgroundColor: Colors.blueGrey,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () async {
                          exportedImage = await controller.toPngBytes();
                          //

                          setState(() {});
                        },
                        child: const Text(
                          "Firmar",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))))),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.clear();
                        },
                        child: const Text(
                          "Borrar",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.black)))))),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
