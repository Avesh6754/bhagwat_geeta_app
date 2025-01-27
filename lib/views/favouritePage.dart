import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/bhagwatgeetaProvider.dart';

import '../provider/bhagwatgeetaProvider.dart';


class Favouritepage extends StatelessWidget {
  const Favouritepage({super.key,});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    BhagwatGeetaProvider providertrue =
    Provider.of<BhagwatGeetaProvider>(context, listen: true);
    BhagwatGeetaProvider providerfalse =
    Provider.of<BhagwatGeetaProvider>(context, listen: false);
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.secondary
            )),
        title: Text(
          'Favourite',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        actions: [
          PopupMenuButton(
            color: Theme.of(context).colorScheme.primary,
            icon: Icon(
              Icons.translate,
              size: width * 0.07,
              color: Theme.of(context).colorScheme.secondary,
            ),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 1,
                child: Text('Hindi',
                    style: TextStyle(
                      fontSize: width * 0.036,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text('English',
                    style: TextStyle(
                      fontSize: width * 0.036,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Text('Gujarati',
                    style: TextStyle(
                      fontSize: width * 0.036,
                      color: Theme.of(context).colorScheme.secondary,
                    )),
              ),
            ],
            onSelected: (item) {
              if (item == 1) {
                providerfalse.languageTranslate('hindi');
              } else if (item == 2) {
                providerfalse.languageTranslate('english');
              } else if (item == 3) {
                providerfalse.languageTranslate('gujarati');
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/image/bg.jpg'))),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
          ),
          ListView.builder(itemCount: providertrue.saveList.length,itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  providerfalse.showSholk(providertrue.saveList[index]);
                },
                child: Card(
                  color:Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(0.6),
                  child: ListTile(
                    title:Text(maxLines: (providertrue.saveList[index].showAll==true)?null:3,providerfalse.translate(providertrue.saveList[index])),
                    trailing:IconButton(onPressed: () {
                      providerfalse.removeFromList(index);
                    }, icon: Icon(Icons.favorite)),
                  ),
                ),
              ),
            );
          },),
        ],
      ),
    );
  }
}
