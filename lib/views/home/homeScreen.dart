import 'package:bhagwat_geeta_app/provider/bhagwatgeetaProvider.dart';
import 'package:bhagwat_geeta_app/utils/global.dart';
import 'package:bhagwat_geeta_app/views/SlokScreen/slokList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    BhagwatGeetaProvider providertrue =
        Provider.of<BhagwatGeetaProvider>(context, listen: true);
    BhagwatGeetaProvider providerfalse =
        Provider.of<BhagwatGeetaProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff401A03),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text(
          '${language[0]}',
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
            itemCount: providertrue.bhagwatgitaList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                providertrue.selectedindex=index;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sloklist(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Card(
                  color: Color(0xff534133).withOpacity(0.8),
                  child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                strokeAlign: BorderSide.strokeAlignOutside,
                                width: 1.8,
                                color: Colors.amber.shade600)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(image[index]),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      title: Text(
                        '${providertrue.bhagwatgitaList[index].chapterName.sanskrit}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                      subtitle: Text(
                        'कुल : ${providertrue.bhagwatgitaList[index].verseeList.length} श्लोक',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage('assets/image/download.png'))),
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
