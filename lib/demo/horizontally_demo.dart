import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HorizontallyDemo extends StatelessWidget {
  static const String routeName = "/horizontally";

  void config() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
  }

  @override
  Widget build(BuildContext context) {
    config();

    var titleText = Container(
      padding: EdgeInsets.all(20.0),
      child: Text(
        'Strawberry Pavlova',
        style: TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.5,
            fontSize: 30.0
        ),
      ),
    );

    var subTitle = Text(
      '''
Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.
''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Georgia',
        fontSize: 25.0,
      ),
    );

    var ratings = Container(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 35.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.star, color: Colors.red,),
              Icon(Icons.star, color: Colors.red,),
              Icon(Icons.star, color: Colors.red,),
              Icon(Icons.star, color: Colors.grey,),
              Icon(Icons.star, color: Colors.grey,),
            ],),
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20.0,
            ),
          )
        ],
      ),
    );

    var descTextStyle = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 18.0,
        height: 2.0
    );

    Column _buildIconColumn(Color color, IconData icon, String label,
        String label2) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Text(label, style: descTextStyle),
          Text(label2, style: descTextStyle)
        ],
      );
    }

    var leftColumn = Container(
      padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: ListView(
        children: <Widget>[
          titleText,
          subTitle,
          ratings,
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildIconColumn(
                  Colors.green[500], Icons.kitchen, 'PREP:', '25 min'
              ),
              _buildIconColumn(
                  Colors.green[500], Icons.timer, 'COOK:', '1 hr'
              ),
              _buildIconColumn(
                  Colors.green[500], Icons.restaurant, 'FEEDS:', '4-6'
              ),
            ],)
        ],
      ),
    );

    var mainImage = Image.asset(
      'images/lake.jpg',
      fit: BoxFit.cover,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Horizontally"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 500.0,
                  child: leftColumn,
                ),
                Expanded(
                  child: mainImage,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

