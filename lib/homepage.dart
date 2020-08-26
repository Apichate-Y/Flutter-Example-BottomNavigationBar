import 'package:flutter/material.dart';
import 'package:flutter_example_bottomnavigationbar/screen/screen1.dart';
import 'package:flutter_example_bottomnavigationbar/screen/screen2.dart';
import 'package:flutter_example_bottomnavigationbar/screen/screen3.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title, Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  static List<String> _title = ["Screen 1", "Screen 2", "Screen 3"];
  static List<String> _subTitle = [
    'new page screen 1',
    'new page screen 2',
    'new page screen 3'
  ];

  static List<Widget> _routToService = [Screen1(), Screen2(), Screen3()];
  static List<Widget> _widgetOptions = [_home(), _shopping(), _accout()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo NavigationBar'),
      ),
      body: Center(
        child: _widgetOptions[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: Text('Shopping'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Accout'),
          ),
        ],
      ),
    );
  }

  static Widget _home() {
    return ListView.builder(
        itemCount: _title.length,
        itemBuilder: (_, index) {
          return Card(
            child: ListTile(
              leading: Icon(
                Icons.tv,
                color: index % 2 == 1 ? Colors.green : Colors.red,
              ),
              title: Text(_title[index]),
              subtitle: Text(_subTitle[index]),
              trailing: IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    _,
                    MaterialPageRoute(
                      builder: (BuildContext context) => _routToService[index],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }

  static Widget _shopping() {
    return Text(
      'Shopping',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  static Widget _accout() {
    return Text(
      'Accout',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
