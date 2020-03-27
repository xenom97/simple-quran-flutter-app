import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuranJuz {
  final String id;
  final String suratName;
  final String suratText;
  final String translate;
  final String totalAyat;

  QuranJuz(
      {this.id,
      this.suratName,
      this.suratText,
      this.translate,
      this.totalAyat});

  factory QuranJuz.createSuratList(Map<String, dynamic> json) {
    return QuranJuz(
        id: json['id'].toString(),
        suratName: json['surat_name'],
        suratText: json['surat_text'],
        translate: json['surat_terjemahan'],
        totalAyat: json['count_ayat'].toString());
  }
}

Future<List<QuranJuz>> getSuratList(String juzId) async {
  try {
    final apiUrl = 'http://api.alquran.cloud/v1/juz/$juzId/quran-uthmani';
    final response = await http.get(apiUrl);
    List result = json.decode(response.body)['data'];

    return result.map((surat) => new QuranJuz.createSuratList(surat)).toList();
  } catch (err) {
    throw err;
  }
}
