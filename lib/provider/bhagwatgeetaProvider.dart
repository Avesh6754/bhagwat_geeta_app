import 'dart:convert';

import 'package:bhagwat_geeta_app/modal/modalclass.dart';
import 'package:bhagwat_geeta_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class BhagwatGeetaProvider extends ChangeNotifier {


  List<BhagwatGeeta> bhagwatgitaList = [];
  int selectedindex=0;
  int slokindex=0;
  int imageindex=0;
  List<BhagwatGeeta> bhagwatSaveList=[];
  String explanation='';

  Future<void> fetcData() async {

    String data = await rootBundle.loadString('assets/jsonData/jsondata.json');
    List gita = jsonDecode(data);
    bhagwatgitaList = gita
        .map(
          (e) => BhagwatGeeta.fromJson(e),
        )
        .toList();
    notifyListeners();
  }
  void selectedChapter()
  {

  }
  void indexChange(int index,indeximage)
  {
    slokindex=index;
    if(indeximage>image.length)
      {
        indeximage=0;
        notifyListeners();
      }
    else
    {
      imageindex=indeximage;
      notifyListeners();
    }
    notifyListeners();

  }
  BhagwatGeetaProvider()
  {
    fetcData();
  }
  void updateLanguage(item,BhagwatGeetaProvider gitaJsonProvider, slokindex) {
    if (item == 1) {
      explanation = gitaJsonProvider.bhagwatgitaList[selectedindex].verseeList[slokindex].text.sanskrit;
      notifyListeners();
    } else if (item == 2) {
      explanation = gitaJsonProvider
          .gitaList[selectedindex].verses[slokindex].shlokas.english;
      notifyListeners();
    } else if (item == 3) {
      explanation = gitaJsonProvider
          .gitaList[selectedindex].verses[slokindex].shlokas.gujarati;
      notifyListeners();
    }
  }

}
