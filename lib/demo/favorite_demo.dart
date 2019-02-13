import 'package:flutter/material.dart';
import 'package:flutter_app/demo/app_store_demo.dart';
import 'package:flutter_app/demo/horizontally_demo.dart';
import 'package:flutter_app/demo/list_demo.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {
    setState(() {
      // If the lake is currently favorited, unfavorite it.
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0.0),
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.star)
                : Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18.0,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
}

class FavoriteDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                      color: Colors.grey[500]
                  ),
                ),
              ],
            ),
          ),
          FavoriteWidget()
        ],
      ),
    );

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color,),
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          )
        ],
      );
    }

    RawMaterialButton _buildRawMaterialButton(Color color, IconData icon,
        String label, Widget route) {
      return new RawMaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: _buildButtonColumn(color, icon, label),
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildRawMaterialButton(color, Icons.call, 'CALL', new ListDemo()),
          _buildRawMaterialButton(
              color, Icons.near_me, 'ROUTE', new AppStoreDemo()),
          _buildRawMaterialButton(color, Icons.share, 'SHARE', new ListDemo()),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    Column _imageColumn() {
      return Column(
        children: <Widget>[
          Image.asset(''
              'images/lake.jpg',
            width: 600.0,
            height: 340.0,
            fit: BoxFit.cover,
          )
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Top Lakes"),
        ),
        body: ListView(
          children: [
            _imageColumn(),
            titleSection,
            buttonSection,
            textSection
          ],
        )
    );
  }

}