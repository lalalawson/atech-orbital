import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/const/colors.dart';

import 'coin_data.dart';

class Shop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int numOfCoins = Provider.of<CoinData>(context).numOfCoins;

    return Scaffold(
      backgroundColor: silverwhite,
      appBar: AppBar(
        backgroundColor: silverwhite,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Shop',
          style: TextStyle(
            fontSize: 35,
            fontFamily: 'PixelOperator',
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Provider.of<CoinData>(context).addCoins(100);
            },
            child: Icon(
              Icons.attach_money,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ShopContainer(
                pet: 'cat',
                amount: 500,
              ),
              ShopContainer(
                pet: 'cat',
                amount: 500,
              ),
              ShopContainer(
                pet: 'cat',
                amount: 500,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ShopContainer extends StatelessWidget {
  ShopContainer({this.pet, this.amount});

  final String pet;
  final int amount;

  @override
  Widget build(BuildContext context) {
    int numOfCoins = Provider.of<CoinData>(context).numOfCoins;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (numOfCoins - amount < 0) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Insufficient funds!'),
                      titleTextStyle: TextStyle(
                        fontFamily: 'pixelsix',
                        color: Colors.black,
                        fontSize: 24.0,
                      ),
                      content: Text(
                          'You do not have enough money to purchase this.'),
                      contentTextStyle: TextStyle(
                        fontFamily: 'PixelOperator',
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      actions: [
                        FlatButton(
                          textColor: darkCyan,
                          child: Text(
                            'Ok!',
                            style: TextStyle(fontFamily: 'pixelmix'),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            } else {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Buy this pet?'),
                      titleTextStyle: TextStyle(
                        fontFamily: 'pixelsix',
                        color: Colors.black,
                        fontSize: 24.0,
                      ),
                      content: Text('$amount will be deducted!'),
                      contentTextStyle: TextStyle(
                        fontFamily: 'PixelOperator',
                        color: Colors.black,
                        fontSize: 22.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      actions: [
                        FlatButton(
                          textColor: darkCyan,
                          child: Text(
                            'Yes!',
                            style: TextStyle(fontFamily: 'pixelmix'),
                          ),
                          onPressed: () {
                            Provider.of<CoinData>(context).removeCoins(amount);
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          textColor: darkYellow,
                          child: Text(
                            'No!',
                            style: TextStyle(fontFamily: 'pixelmix'),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            }
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 5.0),
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Image.asset('images/$pet icon.png'),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Text(
              '$amount',
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
      ],
    );
  }
}
