class BhagwatGeeta {
  late var chapter;
  late ChapterName chapterName;
  List<Verses> verseeList = [];

  BhagwatGeeta(
      {required this.chapterName,
        required this.chapter,
        required this.verseeList});

  factory BhagwatGeeta.fromJson(Map m1) {
    return BhagwatGeeta(
        chapterName: ChapterName.fromJson(m1['ChapterName']),
        chapter: m1['Chapter'],
        verseeList: (m1['Verses'] as List)
            .map(
              (e) => Verses.fromJson(e),
        )
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'Chapter': chapter,
      'ChapterName': chapterName.toJson(),
      'Verses': verseeList.map((e) => e.toJson()).toList(),
    };
  }
}

class ChapterName {
  late String sanskrit, english, hindi, gujarati;

  ChapterName({required this.english,
    required this.gujarati,
    required this.hindi,
    required this.sanskrit});

  factory ChapterName.fromJson(Map m1) {
    return ChapterName(
        english: m1['English'],
        gujarati: m1['Gujarati'],
        hindi: m1['Hindi'],
        sanskrit: m1['Sanskrit']);
  }

  Map<String, dynamic> toJson() {
    return {
      'English': english,
      'Gujarati': gujarati,
      'Hindi': hindi,
      'Sanskrit': sanskrit,
    };
  }
}

class Verses {
  late var versesNumber;
  late Text text;
  late bool isFavourite;
  late bool showAll=false;

  Verses({required this.text, required this.versesNumber,required this.isFavourite,});

  factory Verses.fromJson(Map m1) {
    return Verses(
        text: Text.fromJson(m1['Text']), versesNumber: m1['VerseNumber'],isFavourite: false,);
  }

  Map<String, dynamic> toJson() {
    return {
      'VerseNumber': versesNumber,
      'Text': text.toJson(),
    };
  }
}


class Text {
  late String sanskrit, english, hindi, gujarati;

  Text({required this.english,
    required this.gujarati,
    required this.hindi,
    required this.sanskrit});

  factory Text.fromJson(Map m1) {
    return Text(
        english: m1['English'],
        gujarati: m1['Gujarati'],
        hindi: m1['Hindi'],
        sanskrit: m1['Sanskrit']);
  }

  Map<String, dynamic> toJson() {
    return {
      'English': english,
      'Gujarati': gujarati,
      'Hindi': hindi,
      'Sanskrit': sanskrit,
    };
  }
}
