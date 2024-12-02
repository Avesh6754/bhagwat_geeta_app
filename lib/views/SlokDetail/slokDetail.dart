import 'package:bhagwat_geeta_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/bhagwatgeetaProvider.dart';

class Slokdetail extends StatelessWidget {
  const Slokdetail({super.key});

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
          '${providertrue.bhagwatgitaList[providertrue.selectedindex].chapterName.hindi}',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.translate,
              size: width * 0.07,
              color: Colors.white,
            ),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 1,
                child: Text('Hindi',
                    style: TextStyle(
                        fontSize: width * 0.036, color: Colors.white)),
              ),
              PopupMenuItem<int>(
                value: 2,
                child: Text('English',
                    style: TextStyle(
                        fontSize: width * 0.036, color: Colors.white)),
              ),
              PopupMenuItem<int>(
                value: 3,
                child: Text('Gujarati',
                    style: TextStyle(
                        fontSize: width * 0.036, color: Colors.white)),
              ),
            ],
            onSelected: (item) {
providerfalse.updateLanguage(item,providertrue,providertrue.slokindex);
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${providertrue.bhagwatgitaList[providertrue.selectedindex].verseeList[providertrue.slokindex].text.sanskrit}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  '',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                Text(
                  '${providertrue.bhagwatgitaList[providertrue.selectedindex].verseeList[providertrue.slokindex].text.hindi}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
