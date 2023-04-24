import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Articlebar extends StatelessWidget {
  late String label;
  late String imageurl;
  Articlebar({required this.imageurl, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Divider(),
        Container(
            child: Stack(children: <Widget>[
          Container(
              alignment: Alignment.center, child: Image.network(imageurl)),
          Container(
            alignment: Alignment.topLeft,
            child: Text(label,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22)),
          )
        ]))
      ],
    ));
  }
}
