import 'package:flutter/material.dart';
import 'package:sqflite_flutter/database_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SqfLite In Flutter'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance
                    .insert({DatabaseHelper.columnName: 'Subtitle'});
                print('The inserted id is $i');
              },
              child: Text('Insert'),
              color: Colors.grey[400],
            ),
            FlatButton(
              onPressed: () async {
                List<Map<String, dynamic>> showAll =
                    await DatabaseHelper.instance.queryAll();
                print(showAll);
              },
              child: Text('Query'),
              color: Colors.green[400],
            ),
            FlatButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance.update({
                  DatabaseHelper.columnId: 9,
                  DatabaseHelper.columnName: 'Hau'
                });
              },
              child: Text('Update'),
              color: Colors.blue[400],
            ),
            FlatButton(
              onPressed: () async {
                int i = await DatabaseHelper.instance.delete(9);
              },
              child: Text('Delete'),
              color: Colors.red[400],
            )
          ],
        ),
      ),
    );
  }
}
