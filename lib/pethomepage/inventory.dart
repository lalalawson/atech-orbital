import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:purrductive/const/colors.dart';

import 'coin_data.dart';

class Inventory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> pets = Provider.of<CoinData>(context).allPets;
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
              pets.contains('cat')
                  ? InventoryContainer(
                      pet: 'cat',
                    )
                  : LockedContainer(),
              pets.contains('panda')
                  ? InventoryContainer(
                      pet: 'panda',
                    )
                  : LockedContainer(),
              pets.contains('lion')
                  ? InventoryContainer(
                      pet: 'lion',
                    )
                  : LockedContainer(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              pets.contains('fox')
                  ? InventoryContainer(
                      pet: 'fox',
                    )
                  : LockedContainer(),
              pets.contains('octopus')
                  ? InventoryContainer(
                      pet: 'octopus',
                    )
                  : LockedContainer(),
              pets.contains('koala')
                  ? InventoryContainer(
                      pet: 'koala',
                    )
                  : LockedContainer(),
            ],
          ),
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
    String currentPet = Provider.of<CoinData>(context).currentPet;
    bool current = (currentPet == pet);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Set as companion?'),
                    titleTextStyle: TextStyle(
                      fontFamily: 'pixelsix',
                      color: Colors.black,
                      fontSize: 24.0,
                    ),
                    content: Text('$pet will become your buddy!'),
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
                          Provider.of<CoinData>(context).changePet(pet);
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
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(
                  color: current ? greenblue : Colors.grey, width: 5.0),
              borderRadius: BorderRadius.circular(15),
              color: current ? offWhite : Colors.white,
            ),
            child: Image.asset('images/$pet icon.png'),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class LockedContainer extends StatelessWidget {
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
            color: Colors.blueGrey,
          ),
          child: Icon(Icons.lock),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
