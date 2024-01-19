import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: map(),debugShowCheckedModeBanner: false,));
}
class map extends StatefulWidget {
  const map({super.key});

  @override
  State<map> createState() => _mapState();
}

class _mapState extends State<map> {
  Map m={'name':'Computer','rate':1000,'qty':10};
  List <Map>l=[
    {'name':'Computer','rate':1000,'qty':10},
    {'name':'AC','rate':2000,'qty':2},
    {'name':'TV','rate':3000,'qty':1},
    {'name':'laptop','rate':600,'qty':4},
    {'name':'mouse','rate':500,'qty':2}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MAP"),
      ),
      // body: Text("${m}"),//single data mate
      body:Column(children: [
        Expanded(child:  ListView.builder(itemCount: l.length,itemBuilder: (context, index) {
          return ListTile(title:Wrap(alignment: WrapAlignment.spaceEvenly,children: [
            Text("${l[index]['name']}"),
            Text("${l[index]['rate']}"),
            Text("${l[index]['qty']}"),
          ]),);
        },),)
      ],)
    );
  }
}
