import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  TextDetector textDetector = GoogleMlKit.vision.textDetector();
  final nopolController = TextEditingController();
  String _extractText = 'TES';
  File? image;
  File? imageOne;
  File? imageTwo;

  String? typeCar;

  // List of items in our dropdown menu
  final items = [
    'Toyota',
    'Bentley',
    'Mercedez Benz',
    'Audi',
    'BMW',
  ];

  bool _nopolValidator(String value) {
    String pattern1 = r'^[A-Z]{1,2}\s{1}\d{0,4}\s{0,1}[A-Z]{0,3}$';
    RegExp regex1 = new RegExp(pattern1);
    if (!regex1.hasMatch(value)) return false;
    return true;
  }

    Future pickImageCar(String imageName) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        imageName=="imageOne"?this.imageOne=imageTemporary:this.imageTwo=imageTemporary;
      });
      nopolController.text = this._extractText;
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      //args support android / Web , i don't have a mac

      final inputImage = InputImage.fromFile(imageTemporary);
      final RecognisedText recognisedText =
          await textDetector.processImage(inputImage);
      this.setState(() {
        this._extractText =
            "Plat nomer tidak valid,coba arahkan ke arah kaleng plat nomer";
      });
      String text = recognisedText.text;
      // String pattern1 = r'^[A-Z]{1,2}\s{1}\d{0,4}\s{0,1}[A-Z]{0,3}$';
      // RegExp exp = RegExp(pattern1);
      // Iterable<Match> matches = exp.allMatches(text);
      // for (Match m in matches) {
      //   String match = m[0]!;
      //   setState(() {
      //     this._extractText = match;
      //   });
      // }
      //       String pattern2 = r'^[A-Z]{1,2}\s{1}\d{1,4}\s{1}[A-Z]{1,3}$';
      // RegExp exp2 = RegExp(pattern2);
      // Iterable<Match> matches2 = exp2.allMatches(text);
      // for (Match m in matches2) {
      //   String match = m[0]!;
      //   setState(() {
      //     this._extractText = match;
      //   });
      // }
      String joinExtractedEmail = "";
      for (TextBlock block in recognisedText.blocks) {
        int i = 0;
        print("isi");
        print(block.lines.length);
        for (TextLine line in block.lines) {
          if (_nopolValidator(line.text)) {
            setState(() {
              this._extractText = line.text;
            });
          } else {
            joinExtractedEmail += " " + line.text;
            if (_nopolValidator(joinExtractedEmail.trim())) {
              setState(() {
                this._extractText = joinExtractedEmail;
              });
            }
            if (block.lines.length == i) {
              setState(() {
                this._extractText = "Plat nomer tidak valid";
              });
            }
          }
          // Same getters as TextBlock
          for (TextElement element in line.elements) {
            // Same getters as TextBlock
          }
          i++;
        }
      }
      setState(() {
        this.image = imageTemporary;
      });
      nopolController.text = this._extractText;
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  void dispose() async {
    nopolController.dispose();
    super.dispose();
    await textDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.blue.withOpacity(0.8),
            Colors.blue.withOpacity(0.7),
            Colors.blue.withOpacity(0.6),
            Colors.blue.withOpacity(0.5),
            Colors.blue.withOpacity(0.4),
            Colors.blue.withOpacity(0.3),
            Colors.blue.withOpacity(0.2),
            Colors.blue.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () => pickImage(),
                  child: Container(
                    // margin: EdgeInsets.all(20),
                    // padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ], borderRadius: BorderRadius.circular(15)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    child: image != null
                        ? Image.file(
                            image!,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            "https://react.semantic-ui.com/images/wireframe/image.png",
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                ),
                TextFormField(
                  enabled: false,
                  controller: nopolController,
                ),
                DropdownButton(
                  isExpanded: true,
                  hint: Text("Pilih Tipe"),
                  value: typeCar,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) {
                    setState(() {
                      this.typeCar = value.toString();
                    });
                  },
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: Column(
                        children: [
                          Text("Capture One"),
                          GestureDetector(
                            onTap: () => pickImageCar("imageOne"),
                            child: Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ], borderRadius: BorderRadius.circular(15)),
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 7,
                              child: imageOne != null
                                  ? Image.file(
                                      imageOne!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "https://react.semantic-ui.com/images/wireframe/image.png",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ],
                      )),
                      Container(
                          child: Column(
                        children: [
                          Text("Capture Two"),
                          GestureDetector(
                            onTap: () => pickImageCar("imageTwo"),
                            child: Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ], borderRadius: BorderRadius.circular(15)),
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 7,
                              child: imageTwo != null
                                  ? Image.file(
                                      imageTwo!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      "https://react.semantic-ui.com/images/wireframe/image.png",
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        child: Container(
          child: Text(item),
        ),
        value: item,
      );
}
