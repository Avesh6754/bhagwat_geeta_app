import 'dart:convert';
import 'dart:developer';

import 'package:bhagwat_geeta_app/modal/modalclass.dart';
import 'package:bhagwat_geeta_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class BhagwatGeetaProvider extends ChangeNotifier {
  List<BhagwatGeeta> bhagwatgitaList = [];

  List<Verses> get saveList =>favoritesVerses;
  int selectedindex = 0;
  int slokindex = 0;
  int imageindex = 0;

  late SharedPreferences sharedPreferences;
  List<Verses> favoritesVerses = [];
  bool isDark = true;
  String currentLanguage = 'hindi';

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
void showSholk(Verses verse)
{
  verse.showAll=!verse.showAll;
  notifyListeners();
}
  Future<void> setCloseTheme(bool isDark) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('show', isDark);
  }

  Future<void> getCloseTheme() async {
    sharedPreferences = await SharedPreferences.getInstance();
    isDark = sharedPreferences.getBool('show') ?? false;
  }

  void setTheme() {
    isDark = !isDark;
    setCloseTheme(isDark);
    notifyListeners();
  }

  void languageTranslate(String language) {
    currentLanguage = language;
    notifyListeners();
  }

  void chapterIndex(int chapter) {
    selectedindex = chapter;
    notifyListeners();
  }

  String getTranslation(int index) {
    var verse = bhagwatgitaList[selectedindex].verseeList[index].text;
    if (currentLanguage == 'hindi') {
      return verse.hindi;
    } else if (currentLanguage == 'english') {
      return verse.english;
    } else if (currentLanguage == 'gujarati') {
      return verse.gujarati;
    }
    return verse.sanskrit; // Default to Hindi
  }
  String translate(Verses verse) {

    if (currentLanguage == 'hindi') {
      return verse.text.hindi;
    } else if (currentLanguage == 'english') {
      return verse.text.english;
    } else if (currentLanguage == 'gujarati') {
      return verse.text.gujarati;
    }
    return verse.text.sanskrit; // Default to Hindi
  }

  void slokeIndexChange(int index) {
    slokindex = index;
    notifyListeners();
  }

  void imageSetting(int index) {
    imageindex = index;
    notifyListeners();
  }

  BhagwatGeetaProvider() {
    fetcData();
    getCloseTheme();
  }

  void toggleMethod(Verses verse) {
    verse.isFavourite = !verse.isFavourite;
    print(verse.isFavourite);
    if (verse.isFavourite == true) {
      favoritesVerses.add(verse);

      saveGeetaList(favoritesVerses);

      notifyListeners();
    } else {
      favoritesVerses.remove(verse);
      saveGeetaList(favoritesVerses);

      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> convertIntoStringAndSaveData(
      List<Verses> favoritesVerses) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonList = favoritesVerses
        .map(
          (e) => jsonEncode(e.toJson()),
        )
        .toList();
    await prefs.setStringList('fav', jsonList);
  }

  Future<List<Verses>> loadItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList('fav') ?? [];
    return jsonList.map((json) => Verses.fromJson(jsonDecode(json))).toList();
  }

  Future<void> fetchSaveData() async {
    favoritesVerses = await loadItems();
    notifyListeners();
  }

  Future<void> saveGeetaList(List<Verses> saveList) async {
    favoritesVerses = saveList;
    await convertIntoStringAndSaveData(saveList);
    notifyListeners();
  }
  void removeFromList(int index) {
    saveList.removeAt(index);
    notifyListeners();
  }
}
