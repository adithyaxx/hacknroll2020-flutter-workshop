import 'package:flutter/material.dart';
import 'package:list_app/details_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var values = Map();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List App"),
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int i) {
            return _buildRow(i);
          },
          itemCount: 500,
          separatorBuilder: (BuildContext context, int index) => Divider(
            height: 1,
            color: Colors.black,
          ),
        ));
  }

  Widget _buildRow(int i) {
    return ListTile(
      title: Padding(
        child: Text(
          i.toString(),
        ),
        padding: EdgeInsets.only(left: 16),
      ),
      trailing: IconButton(
        icon: Icon(values.containsKey(i) && values[i]
            ? Icons.favorite
            : Icons.favorite_border),
        onPressed: () {
          setState(() {
            if (values.containsKey(i))
              values[i] = !values[i];
            else
              values.putIfAbsent(i, () => true);
          });
        },
      ),
      onTap: () async => print(
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(i.toString(), "Details"),
          ),
        ),
      ),
    );
  }

  updateValue(String i) {
    print("Value: $i");
  }
}
