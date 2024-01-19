import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: text(),));
}
class text extends StatefulWidget {
  const text({super.key});

  @override
  State<text> createState() => _textState();
}

class _textState extends State<text> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        title: Text("Continer")
    ),
      body:  Center(
      child: Container(
      color: Colors.green,
      padding: EdgeInsets.all(20),
      child: Text(
        'hello good  mornig ',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ), //Text
      /** BoxConstraints Widget **/
      constraints: BoxConstraints(
          minHeight: 50,
        ), //BoxConstraints
    ), //container
    ), //Center
    );
  }
}
