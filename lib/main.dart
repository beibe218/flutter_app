import 'package:flutter/material.dart';
import 'package:flutter_app/demo/favorite_demo.dart';

void main() =>
    runApp(
        MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.red
          ),
          title: 'Fluter',
          home: new FavoriteDemo(),
        )
    );