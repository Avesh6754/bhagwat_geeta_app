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
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Icon(
          Icons.menu,
          color: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          '${language[0]}',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        actions: [
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
              icon: Icon(Icons.dark_mode))
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
                providerfalse.chapterIndex(index);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sloklist(),
                    ));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Card(
                  color:  Theme.of(context).colorScheme.primary,
                  child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                strokeAlign: BorderSide.strokeAlignOutside,
                                width: 1.8,
                                color: Theme.of(context).colorScheme.secondary,)),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(image[index]),
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      title: Text(
                        maxLines: 1,'${providertrue.bhagwatgitaList[index].chapterName.hindi}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color:Theme.of(context).colorScheme.secondary,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                      subtitle: Text(
                        'कुल : ${providertrue.bhagwatgitaList[index].verseeList.length} श्लोक',
                        style: TextStyle(color: Theme.of(context).colorScheme.secondary,),
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
