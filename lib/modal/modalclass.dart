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
}

class ChapterName {
  late String sanskrit, english, hindi, gujarati;

  ChapterName(
      {required this.english,
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
}

class Verses {
  late var versesNumber;
  late Text text;

  Verses({required this.text, required this.versesNumber});

  factory Verses.fromJson(Map m1) {
    return Verses(
        text: Text.fromJson(m1['Text']), versesNumber: m1['VerseNumber']);
  }
}

class Text {
  late String sanskrit, english, hindi, gujarati;

  Text(
      {required this.english,
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
}
