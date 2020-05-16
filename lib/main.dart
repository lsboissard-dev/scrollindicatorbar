import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      title: 'ScrollIndicatorBar',
    ),
  );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double scrollPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: _body(),
    );
  }

  _appbar() {
    return AppBar(
      title: Text('ScrollIndicatorBar'),
    );
  }

  _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 16,
          width: scrollPosition,
          color: Colors.blue,
        ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
            ),
            onNotification: (n) {
              setState(() {
                scrollPosition = n.metrics.pixels /
                    (n.metrics.maxScrollExtent /
                        MediaQuery.of(context).size.width);
              });
              return true;
            },
          ),
        ),
      ],
    );
  }
}
