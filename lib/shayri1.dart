import 'package:flutter/material.dart';
import 'package:untitled/data.dart';
import 'package:untitled/shayri2.dart';

class shayri1 extends StatefulWidget {
  int index;
  shayri1(this.index);

  @override
  State<shayri1> createState() => _shayri1State();
}

class _shayri1State extends State<shayri1> {
  List <bool>temp=[];
  List ar=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch(widget.index)
        {
      case 0:
        {
          ar=data.jivan_shayri;
          break;
        }
      case 1:
        {
          ar=data.mohobat_shayri;
          break;
        }
      case 2:
        {
          ar=data.yaade_shayri;
          break;
        }
      case 3:
        {
          ar=data.rajniti_shayri;
          break;
        }
      case 4:
        {
          ar=data.dard_shayri;
          break;
        }
      case 5:
        {
          ar=data.pyar_shayri;
          break;
        }
      case 6:
        {
          ar=data.doctor_shayri;
          break;
        }
        case 7:
      {
        ar=data.prenna_shayri;
        break;
      }
    }
    temp=List.filled(ar.length, false);



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("${data.arr[widget.index]}"),
      backgroundColor: Colors.pinkAccent  ,
    ),
      body: ListView.builder(itemCount: ar.length,itemBuilder: (context, index) {
        return Card(child:GestureDetector(
          onTapUp: (details) {
            temp[index]=false;
            setState(() {
            });
          },
          onTapDown: (details) {
            temp[index]=true;
            setState(() {
            });
          },
          onTapCancel: () {
            temp[index]=false;
            setState(() {
            });
          },
          child:  ListTile(onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return shayri2(index,ar);
          },));
        },
          leading: Image(image: AssetImage("${data.img[widget.index]}")),
            trailing: (temp[index]==true)?Icon(Icons.arrow_forward_ios_rounded):null,
            tileColor: (temp[index]==true)?Colors.pink:Colors.teal,
          title: Text("${ar[index]}",maxLines: 1,),
        ),)
        );
      },),
    );
  }
}
