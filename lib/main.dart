import 'package:flutter/material.dart';
import 'next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shunichi App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Shunichi App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titleList = ['Amazon', '楽天', 'LINE', 'Google'];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (BuildContext context, int i) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  //画面遷移の処理
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NextPage(titleList[i])));
                },
                leading: Icon(Icons.vpn_key),
                title: Text(titleList[i]),
              ),
              Divider(),
            ],
          );
        },
      ),

      //ボタンのアクションを定義する
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //ボタンが押下の処理を記載
          titleList.add('Google');
          setState(() {});
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

