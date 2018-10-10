import 'package:flutter/material.dart';
import 'package:wyn_wyn/add.dart';

class Main extends StatefulWidget {
  final tabs = [
    Tab(
      icon: Icon(Icons.check_box),
      child: Add(),
    ),
    Tab(
      icon: Icon(Icons.list),
      child: Container(),
    ),
  ];

  @override
  State<StatefulWidget> createState() => MainView();
}

abstract class MainState extends State<Main> {
  @protected
  int number = 1;
}

class MainView extends MainState {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Scaffold(
        appBar: AppBar(),
        drawer: _drawer(),
        body: TabBarView(
          children: widget.tabs.map((tab) {
            return tab.child;
          }).toList(),
        ),
        floatingActionButton: _floatingActionButton(),
        bottomNavigationBar: TabBar(tabs: widget.tabs),
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              number.toString(),
            ),
            onTap: () {},
          ),
          AboutListTile(),
        ],
      ),
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Add()),
        );
      },
    );
  }
}
