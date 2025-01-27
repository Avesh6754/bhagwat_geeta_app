import 'package:bhagwat_geeta_app/utils/global.dart';
import 'package:bhagwat_geeta_app/views/favouritePage.dart';
import 'package:flutter/cupertino.dart';
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


    PageController pageController =
        PageController(initialPage: providertrue.slokindex);
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
              color: Theme.of(context).colorScheme.secondary,
            )),
        title: Text(
          '${providertrue.bhagwatgitaList[providertrue.selectedindex].chapterName.hindi}',
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Favouritepage(),
                    ));
              },
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.secondary,
              )),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    providerfalse.slokeIndexChange(index);
                  },
                  itemCount: providertrue
                      .bhagwatgitaList[providertrue.selectedindex]
                      .verseeList
                      .length,
                  itemBuilder: (context, index) {
                    var verse = providertrue
                        .bhagwatgitaList[providertrue.selectedindex]
                        .verseeList[index];
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.6),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                verse.text.sanskrit,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.secondary),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                providertrue.getTranslation(index),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              IconButton.filled(onPressed: ()  {
                                providerfalse.toggleMethod(verse);
                              }, icon: (verse.isFavourite==true)?Icon(Icons.favorite,color: Theme.of(context).colorScheme.secondary,):Icon(Icons.favorite_border,color: Theme.of(context).colorScheme.secondary,),)
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (providertrue.slokindex > 0) {
                          providerfalse
                              .slokeIndexChange(providertrue.slokindex - 1);
                          pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text('Previous',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          )),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (providertrue.slokindex <
                            providertrue
                                    .bhagwatgitaList[providertrue.selectedindex]
                                    .verseeList
                                    .length -
                                1) {
                          providerfalse
                              .slokeIndexChange(providertrue.slokindex + 1);
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
