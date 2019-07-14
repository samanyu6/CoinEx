import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

void main() {
  runApp(mainapp());
}

class mainapp extends StatelessWidget {
  List widgetList = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

  Widget header() => Container(
        //  height: deviceSize.height/5,
        alignment: Alignment(-0.8, 0),
        // height: 100,
        child: GradientText("Rates",
            gradient: LinearGradient(colors: [Colors.black, Colors.black87]),
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            )),
      );

  Widget textHead(String text) => Container(
      alignment: Alignment(-0.8, 0),
      padding: EdgeInsets.only(top: 20),
      child: GradientText(text,
          gradient: LinearGradient(colors: [Colors.black, Colors.black87]),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          )));

  Widget card(String gain) => Container(
      width: 300,
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Center(
        child: GradientCard(
          gradient: LinearGradient(
              // colors: [Colors.blueAccent, Colors.greenAccent]
              colors: gain == 'loss'
                  ? [Colors.orangeAccent, Colors.redAccent]
                  : [Colors.green[200], Colors.greenAccent]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                // leading: Icon(Icons.album),
                title: Text(
                  'Bitcoin',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                // subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.',style: TextStyle(color: Colors.white))
              ),
              ButtonTheme.bar(
                // make buttons use the appropriate styles for cards
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {
                        print('x');
                      },
                    ),
                    FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));

  Widget marque() => Container(
      // padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[card('gain'), card('loss'), card('gain')],
      ));

  Widget topPart() => Container(
          child: Column(
        children: <Widget>[textHead('text'), marque()],
      ));

  Widget bod() => Container(
        padding: EdgeInsets.only(top: 45.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[header(), topPart()],
        ),
        color: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exchange rates',
      home: bod(),
      theme: ThemeData(backgroundColor: Colors.white),
    );
  }
}
