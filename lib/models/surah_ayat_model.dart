import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SurahAyah {
  final String ayahNumber;
  final String ayahText;
  final bool sajda;

  SurahAyah({
    this.ayahNumber,
    this.ayahText,
    this.sajda,
  });

  factory SurahAyah.createSurahAyahData(Map<String, dynamic> json) {
    return SurahAyah(
      ayahNumber: json['numberInSurah'].toString(),
      ayahText: json['text'],
      sajda: json['sajda'],
    );
  }
}

Future<List<SurahAyah>> getSurahAyahData(String surahId) async {
  final apiUrl =
      'http://api.alquran.cloud/v1/surah/$surahId/editions/quran-uthmani';
  final response = await http.get(apiUrl);
  List result = json.decode(response.body)['data'][0]['ayahs'];

  return result.map((ayah) => new SurahAyah.createSurahAyahData(ayah)).toList();
}
