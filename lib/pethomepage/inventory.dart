import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/const/colors.dart';

class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: silverwhite,
      appBar: AppBar(
        backgroundColor: silverwhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Inventory',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'PixelOperator',
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InventoryContainer(
                pet: 'cat',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class InventoryContainer extends StatelessWidget {
  InventoryContainer({this.pet});

  final String pet;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 5.0),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Image.asset('images/$pet icon.png'),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
