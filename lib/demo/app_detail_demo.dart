import 'package:flutter/material.dart';

class AppDetailDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppStoreDetail'),
      ),
      body: Center(
          child: new Text('detail')
      ),
    );
  }
}