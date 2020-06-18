import 'package:flutter/material.dart';
import './simple.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());

}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 4;
  List<LinearSales> _data = [];
  List<LinearSales> _data1 = [];
  List<LinearSales> _data2 = [];
  List<LinearSales> _data3 = [];
  List<LinearSales> _data4 = [];

  var _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    final random = new Random();
    Timer.periodic(
        Duration(milliseconds: 1000),
            (Timer t) => setState(() {
          _now = DateTime.now();
          _counter++;
          _data1.add(new LinearSales(_counter + 1, 10 + random.nextInt(10)));
          _data2.add(new LinearSales(_counter + 2, 50 + random.nextInt(10)));
          _data3.add(new LinearSales(_counter + 3, 100 + random.nextInt(10)));
          _data4.add(new LinearSales(_counter + 4, 120 + random.nextInt(10)));
        }));
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;

      _data.clear();
      final random = new Random();
      for(int i = 0; i < 4000; i++) {
        if (i > 1000 && i < 2000) {
          _data.add(new LinearSales(i, random.nextInt(200)));
        }
        else if (i > 2500 && i < 3500) {
          _data.add(new LinearSales(i, random.nextInt(300)));
        }
        else {
          _data.add(new LinearSales(i, random.nextInt(30)));
        }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              //'$_now',
              style: Theme.of(context).textTheme.headline4,
            ),
            Container(
              height: 200,
              child: SimpleLineChart.withRandomData(_data1, _data2, _data3, _data4)),
            Container(
                height: 200,
                child: SimpleLineChart.withSampleData(_data)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
