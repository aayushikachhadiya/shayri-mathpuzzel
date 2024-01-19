import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: chekbox(),));
}
class chekbox extends StatefulWidget {
  const chekbox({super.key});

  @override
  State<chekbox> createState() => _chekboxState();
}

class _chekboxState extends State<chekbox> {
  bool h1=false;
  bool h2=false;
  bool h3=false;
int sum=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("chekbox"),
    ),
      body: Column(children: [Row(children: [
        Checkbox(value: h1, onChanged: (value) {
          h1=value!;
          if(h1==true)
            {
              sum+=200;
            }else
              {
                sum-=200;
              }
          setState(() {
          });
        },
        ),Text("200"),
        Checkbox(value: h2, onChanged: (value) {
          h2=value!;
          if(h2==true)
            {
              sum+=300;
            }else
              {
                sum-=300;
              }
          setState(() {
          });
        },
        ),Text("300"),
        Checkbox(value: h3, onChanged: (value) {
          h3=value!;
          if(h3==true)
            {
              sum+=100;
            }else
              {
                sum-=100;
              }
          setState(() {
          });
        },
        ),Text("100")
      ],),
        Text("${sum}")
      ]),
    );
  }
}
