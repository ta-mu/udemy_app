import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'next_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'パスワードポスト'),
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
  List<String> titleList = ['Amazon', '楽天', 'Yahoo!'];
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
          itemBuilder: (BuildContext context, int i){
            return Column(
              children: [
                ListTile(
                  onTap: (){
                    /// 画面遷移の記述
                    Navigator.push(context, MaterialPageRoute(builder: (context) => NextPage(titleList[i])));
                  },
                  leading: Icon(Icons.vpn_key),
                  title: Text(titleList[i]),
                ),
                Divider(),
              ],
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          /// ボタンが押された処理
          titleList.add("google");
          setState((){
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// todo ホーム画面のタイトル変更
// todo リスト表示
// todo リスト