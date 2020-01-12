import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String pageName, index;

  DetailsPage(this.index, this.pageName);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.pageName),
        ),
        body: Center(
          child: Text(widget.index),
        ),
      ), onWillPop: () async {
        Navigator.pop(context, widget.index);
        return false;
      },
    );
  }
}
