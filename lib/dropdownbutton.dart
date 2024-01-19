import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: drop(),));
}
class drop extends StatefulWidget {
  const drop({super.key});

  @override
  State<drop> createState() => _dropState();
}

class _dropState extends State<drop> {
  int city=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("dropdownbutton"),
    ),
      body: DropdownButton(

        //fix value aapva
      value: city,
      items: [
        DropdownMenuItem(child: Text("Surat"),value: 1,),
        DropdownMenuItem(child: Text("Vapi"),value: 2,),
        DropdownMenuItem(child: Text("Bharuch"),value: 3,),
        DropdownMenuItem(child: Text("Vadodra"),value:4,),
        DropdownMenuItem(child: Text("Kamrej"),value: 5,),
        DropdownMenuItem(child: Text("Ahmedabad"),value: 6,),

      ],onChanged:(value) {
        city=value!;
        setState(() {

        });
      } ,)
    );
  }
}
