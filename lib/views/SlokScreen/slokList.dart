import 'package:bhagwat_geeta_app/views/SlokDetail/slokDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/bhagwatgeetaProvider.dart';
import '../../utils/global.dart';

class Sloklist extends StatelessWidget {
  const Sloklist({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    BhagwatGeetaProvider providertrue =
        Provider.of<BhagwatGeetaProvider>(context, listen: true);
    BhagwatGeetaProvider providerfalse =
        Provider.of<BhagwatGeetaProvider>(context, listen: false);
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
              color:Theme.of(context).colorScheme.secondary,
            )),
        title: Text(
          'स्लोक',
          style: TextStyle(
              color:Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {
                (providertrue.isDark)
                    ? IconButton(
                    onPressed: () {
                      providerfalse.setTheme();
                    },
                    icon: Icon(Icons.light_mode))
                    : IconButton(
                    onPressed: () {
                      providerfalse.setTheme();
                    },
                    icon: Icon(Icons.dark_mode));
              },
              icon: Icon(
                Icons.sunny,
                color: Theme.of(context).colorScheme.secondary,
              ))
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
          ListView.builder(
            itemCount: providertrue.bhagwatgitaList[providertrue.selectedindex].verseeList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                providerfalse.slokeIndexChange(index);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Slokdetail(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:Theme.of(context).colorScheme.primary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10,),
                          CircleAvatar(
                            radius: 5,
                            backgroundColor:Theme.of(context).colorScheme.secondary,
                          ),
                           Column(
                             children: [
                               SizedBox(height: 10,),
                               Text(
                                'श्लोक ${providertrue.bhagwatgitaList[providertrue.selectedindex].verseeList[index].versesNumber}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).colorScheme.secondary,
                                    fontSize: 20,
                                    letterSpacing: 1),
                                                         ),
                               Container(
                                 width: width*0.800,
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                     maxLines: 2,'${providertrue.bhagwatgitaList[providertrue.selectedindex].verseeList[index].text.hindi}',
                                     style: TextStyle(
                                         fontWeight: FontWeight.w500,
                                         color: Theme.of(context).colorScheme.secondary,
                                         fontSize: 15,
                                         letterSpacing: 1),
                                   ),
                                 ),
                               ),
                             ],
                           ),

                      CircleAvatar(
                        radius: 5,
                        backgroundColor:Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(width: 10,),

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
