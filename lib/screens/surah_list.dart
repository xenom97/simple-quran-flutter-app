import 'package:flutter/material.dart';
import 'package:simple_quran_flutter_app/models/surah_model.dart';
import 'package:simple_quran_flutter_app/screens/surah_list_detail.dart';

class SurahList extends StatefulWidget {
  @override
  _SurahListState createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  Future<List<QuranSurah>> _surahList;

  @override
  void initState() {
    super.initState();
    _surahList = getSuratList();
  }

  ListView _suratListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 8,
          child: _tile(
            data[index].id,
            data[index].suratName,
            data[index].suratText,
            data[index].translate,
            data[index].totalAyat,
          ),
        );
      },
    );
  }

  ListTile _tile(
    String id,
    String suratName,
    String suratText,
    String translate,
    String totalAyat,
  ) =>
      ListTile(
        onTap: () => _viewDetail(id, suratName, totalAyat),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        leading: Container(
          padding: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1, color: Colors.black),
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.amberAccent,
            child: Text(
              '$id',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text(
          '$suratName ($suratText)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('$translate ($totalAyat ayat)'),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.amberAccent,
          size: 30,
        ),
      );

  void _viewDetail(String idSurat, String suratName, String totalAyat) {
    // Navigator.of(context).pushNamed('/surahdetail', arguments: idSurat);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SurahListDetail(idSurat, suratName, totalAyat),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Surah List',
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<QuranSurah>>(
            future: _surahList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<QuranSurah> data = snapshot.data;
                return _suratListView(data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
