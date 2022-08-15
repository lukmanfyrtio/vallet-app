import 'package:flutter/material.dart';
import 'package:valet_apps/constant.dart';

class HeaderWithSerachBox extends StatefulWidget {
  @override
  _HeaderWithSerachBoxState createState() => _HeaderWithSerachBoxState();
}

class _HeaderWithSerachBoxState extends State<HeaderWithSerachBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: 20 + kDefaultPadding,
                bottom: 10 + kDefaultPadding),
            height: MediaQuery.of(context).size.height * 0.2 - 25,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue.withOpacity(0.8),Colors.blue.withOpacity(0.6),Colors.blue.withOpacity(0.1)],begin: Alignment.topCenter,end: Alignment.bottomCenter),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi Lukman",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Image.network(
                    "https://raw.githubusercontent.com/lukmanfyrtio/plant-app/master/plant_app/assets/images/logo.png")
              ],
            ),
          )
        ],
      ),
    );
  }
}
