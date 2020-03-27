import 'package:flutter/material.dart';

class JuzList extends StatefulWidget {
  @override
  _JuzListState createState() => _JuzListState();
}

class _JuzListState extends State<JuzList> {
  @override
  void initState() {
    super.initState();
  }

  ListTile _tile(
    String id,
  ) =>
      ListTile(
        onTap: () => _viewDetail(id),
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
          'Juz $id',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.amberAccent,
          size: 30,
        ),
      );

  void _viewDetail(String idJuz) {
    Navigator.of(context).pushNamed('/detail', arguments: idJuz);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Juz List',
          style: TextStyle(color: Colors.amberAccent),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return Card(
                elevation: 8,
                child: _tile((index + 1).toString()),
              );
            },
          ),
        ),
      ),
    );
  }
}
