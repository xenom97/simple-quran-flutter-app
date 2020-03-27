import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuranSurah {
  final String id;
  final String suratName;
  final String suratText;
  final String translate;
  final String totalAyat;

  QuranSurah(
      {this.id,
      this.suratName,
      this.suratText,
      this.translate,
      this.totalAyat});

  factory QuranSurah.createSuratList(Map<String, dynamic> json) {
    return QuranSurah(
        id: json['id'].toString(),
        suratName: json['surat_name'],
        suratText: json['surat_text'],
        translate: json['surat_terjemahan'],
        totalAyat: json['count_ayat'].toString());
  }
}

Future<List<QuranSurah>> getSuratList() async {
  try {
    final apiUrl = 'https://quran.kemenag.go.id/index.php/api/v1/surat';
    final response = await http.get(apiUrl);
    List result = json.decode(response.body)['data'];

    return result
        .map((surat) => new QuranSurah.createSuratList(surat))
        .toList();
  } catch (err) {
    throw err;
  }
}
