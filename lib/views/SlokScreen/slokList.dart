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
        backgroundColor: Color(0xff401A03),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'स्लोक',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.sunny,
                color: Colors.white,
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
                providerfalse.indexChange(index, index);
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
                    color:Color(0xff534133).withOpacity(0.7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.white,
                            ),
                          ),
                           SizedBox(width: 5,),
                           Column(
                             children: [
                               Text(
                                'श्लोक ${providertrue.bhagwatgitaList[providertrue.selectedindex].verseeList[index].versesNumber}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 1),
                                                         ),
                               Container(
                                 width: width*0.800,
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(
                                     '${providertrue.bhagwatgitaList[providertrue.selectedindex].verseeList[index].text.sanskrit}',
                                     style: TextStyle(
                                         fontWeight: FontWeight.w500,
                                         color: Colors.white,
                                         fontSize: 15,
                                         letterSpacing: 1),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                      SizedBox(width: 5,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Colors.white,
                        ),
                      ),

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
