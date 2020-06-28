import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/const/colors.dart';

import 'coin_data.dart';

class PetHomePage extends StatefulWidget {
  @override
  _PetHomePageState createState() => _PetHomePageState();
}

class _PetHomePageState extends State<PetHomePage> {
  @override
  Widget build(BuildContext context) {
    int numOfCoins = Provider.of<CoinData>(context).numOfCoins;

    return Scaffold(
      backgroundColor: silverwhite,
      appBar: AppBar(
        backgroundColor: silverwhite,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Provider.of<CoinData>(context).addCoins(10);
            },
            child: Icon(
              Icons.shopping_cart,
            ),
          ),
          SizedBox(width: 15.0),
          Row(
            children: [
              Text(
                '$numOfCoins',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'PixelOperator',
                  fontSize: 25.0,
                ),
              ),
              Icon(
                Icons.monetization_on,
              ),
            ],
          ),
          SizedBox(width: 15.0),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              child: Image.asset('images/cat.gif'),
            ),
          ),
        ],
      ),
    );
  }
}
