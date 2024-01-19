import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untitled/data.dart';
import 'package:untitled/shayri1.dart';
import 'package:untitled/shayri3.dart';

class shayri2 extends StatefulWidget {
  int index;
  List arr;


  shayri2(this.index, this.arr);

  @override
  State<shayri2> createState() => _shayri2State();
}

class _shayri2State extends State<shayri2> {
  bool color_stauts=false;
  int pos=0,pos1=1;
  List col=[Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.pinkAccent,
    Colors.brown,
    Colors.teal,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.grey,
    Colors.purpleAccent,
    Colors.cyan,
    Colors.yellow,
  Color.fromARGB(264, 242, 250, 50)];

  PageController? controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=PageController(initialPage: widget.index);
  }
  @override
  Widget build(BuildContext context) {
    double Screen_height=MediaQuery.of(context).size.height;
    double Status_bar=MediaQuery.of(context).padding.top;
    double Appbar_height=kToolbarHeight;
    print("Screen_height=$Screen_height");
    print("Status_bar=$Status_bar");
    print("Appbar_height=$Appbar_height");
    return Scaffold(
        appBar: AppBar(
          title: Text("shayri"),
          backgroundColor: Colors.pinkAccent,
        ),
       body: Column(
         children: [

           Row(mainAxisAlignment: MainAxisAlignment.center,children: [
             InkWell(onTap: () {
               showModalBottomSheet(barrierColor: Colors.transparent,isScrollControlled: true,
                 context: context, builder: (context) {
                   return Container(
                     height: Screen_height-Status_bar-Appbar_height-10,
                     child: GridView.builder(itemCount: col.length-1,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount:2,
                       mainAxisSpacing: 10,
                       crossAxisSpacing: 10,
                     ), itemBuilder: (context, index) {
                       return InkWell(onTap: () {
                         pos=index;
                         pos1=index+1;
                         color_stauts==true;
                         Navigator.pop(context);
                         setState(() {

                         });
                       },
                         child: Container(alignment: Alignment.center,
                           child: Text("😍😘😚👩‍🦰🎈💖"
                               "Happy shayri"
                               "😉🤗🤩😍❤",style: TextStyle(fontSize: 30)),
                           decoration: BoxDecoration(gradient:LinearGradient(colors: [col[index],col[index+1]]) ),),
                       );
                     },),

                   );
                 },);

             },child: Container(width: 70,height: 40,child: Image(image: AssetImage("myasset/expand.png")),)),
             Text("${widget.index+1}/${widget.arr.length}"),
             Row(children: [
               InkWell(onTap: () {
                 col.shuffle();
                 color_stauts==true;

                 setState(() {

                 });
               },child: Container(height: 40,width: 70,child: Image(image: AssetImage("myasset/reload.png")),))
             ],)
           ],),
           Expanded(flex: 5,child: PageView.builder(
             itemCount: widget.arr.length,
             controller: controller,
             onPageChanged: (value){
               widget.index=value;
               setState(() {

               });
             },
             itemBuilder: (context, index) {
             return
               Container(
               decoration: BoxDecoration(color: (color_stauts==false)?Colors.pinkAccent:null,
               // gradient: LinearGradient(colors: [col[0],col[1]])
               gradient: (color_stauts==false)
                   ?LinearGradient(colors: [col[pos],col[pos1]]):null

                       ),
                 child: Text("${widget.arr[index]}",style: TextStyle(fontSize: 20),textAlign: TextAlign.center),);
           },)),

           Expanded(flex: 7,child: Row(children: [
             Expanded(child: Container(color: Colors.white,))
           ],)),

           Container(color: Colors.yellow,height: 50,width: double.infinity,child: Expanded(child: Row(
             children: [Flexible(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
             IconButton(onPressed: () {
              Clipboard.setData(ClipboardData(text: "${widget.arr[widget.index]}"));
             }, icon: Icon(Icons.copy),),
             IconButton(onPressed: () {
               (widget.index>0)?widget.index--:widget.index;
                    controller!.jumpToPage(widget.index);
                    setState(() {
                    });
             }, icon: Icon(Icons.arrow_back_ios),),

               InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return shayri3(widget.index,widget.arr);
                 },));
               },child: Container(height: 40,width: 70,child:Container(height: 10,width: 10,child: Image(image: AssetImage("myasset/pencil2.png"),),))),

             IconButton(onPressed: () {

               (widget.index+1<widget.arr.length)?widget.index++:widget.index;
               controller!.jumpToPage(widget.index);
               setState(() {

               });
             }, icon: Icon(Icons.arrow_forward_ios),),
             IconButton(onPressed: () {
                Share.share("${widget.arr[widget.index]}");
             }, icon: Icon(Icons.share),)

           ],)),
           ],)),)
         ],
       ),

    );

  }
}
