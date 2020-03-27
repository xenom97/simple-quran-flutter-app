import 'package:flutter/material.dart';
import 'package:simple_quran_flutter_app/models/surah_ayat_model.dart';

class SurahListDetail extends StatefulWidget {
  final String surahId;
  final String surahName;
  final String totalAyah;

  SurahListDetail(this.surahId, this.surahName, this.totalAyah);

  @override
  _SurahListDetailState createState() => _SurahListDetailState();
}

class _SurahListDetailState extends State<SurahListDetail> {
  Future<List<SurahAyah>> _ayahList;

  @override
  void initState() {
    super.initState();
    _ayahList = getSurahAyahData(widget.surahId);
  }

  ListView _suratListView(data) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 8,
          child: _tile(
            data[index].ayahNumber,
            data[index].ayahText,
          ),
        );
      },
    );
  }

  ListTile _tile(
    String ayahNumber,
    String ayahText,
  ) =>
      ListTile(
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
              '$ayahNumber',
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
          ),
        ),
        title: Text(
          ayahText,
          style: TextStyle(fontSize: 24),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.white,
          size: 30,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.surahName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: FutureBuilder<List<SurahAyah>>(
            future: _ayahList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<SurahAyah> data = snapshot.data;
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
