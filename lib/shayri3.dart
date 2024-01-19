import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:untitled/data.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class shayri3 extends StatefulWidget {
  List aar;
  int indexs;

  shayri3(this.indexs, this.aar);

  @override
  State<shayri3> createState() => _shayri3State();
}

class _shayri3State extends State<shayri3> {
  WidgetsToImageController controller = WidgetsToImageController();
// to save image bytes of widget
  Uint8List? bytes;
  int f1 = 0;
  bool Font_stauts = false;
  bool color_stauts = false;
  bool text = false;
  Color c = Colors.red;
  int pos1 = 0;
  int col_ind = 0;
  List Col = [
    Colors.blueGrey,
    Colors.blue,
    Colors.yellow,
    Colors.teal,
    Colors.red,
    Colors.green,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.cyan,
    Colors.pink,
    Colors.brown,
    Colors.orangeAccent,
    Colors.orange,
    Colors.greenAccent,
    Colors.deepPurple,
    Colors.cyanAccent,
    Colors.lightGreenAccent,
  ];
  List Font = [
    FontWeight.bold,
    FontWeight.normal,
    FontWeight.w100,
    FontWeight.w200,
    FontWeight.w300,
    FontWeight.w500,
    FontWeight.w600,
    FontWeight.w400,
    FontWeight.w700,
    FontWeight.w900,
    FontWeight.w800,
  ];
  int emoji = 0;
  bool status = false ;
  bool color_status = false;

  double a = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_permission();
  }

  get_permission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.location,
        Permission.storage,
      ].request();
    }
  }

  @override
  Widget build(BuildContext context) {
    String car_emoji = "😊🥰😊🥰😊🥰❣❤";
    double screen_height = MediaQuery.of(context).size.height;
    double status_bar = MediaQuery.of(context).padding.top;
    double appbar_height = kToolbarHeight;
    return Scaffold(
        appBar: AppBar(
          title: Text("love shayri"),
          backgroundColor: Colors.pinkAccent,
        ),
        body: Column(
          children: [
            Expanded(
              child: WidgetsToImage(
                controller: controller,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  height: 100,
                  width: 450,
                  decoration: BoxDecoration(
                      color: (color_stauts == false) ? c : Colors.red,
                      gradient: (color_stauts == true)
                          ? LinearGradient(
                              colors: [Col[col_ind], Col[col_ind + 1]])
                          : null),
                  child: Text(
                    (status == false)
                        ? "${widget.aar[widget.indexs]}"
                        : "${data.emoji[emoji]}\n${widget.aar[widget.indexs]}\n${data.emoji[emoji]}",
                    style: TextStyle(
                      fontSize: a,
                      color: (text == false) ? Colors.black : Col[pos1],
                      fontWeight:
                          (Font_stauts == false) ? FontWeight.bold : Font[f1],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.black,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: screen_height -
                                    status_bar -
                                    appbar_height -
                                    10,
                                child: GridView.builder(
                                  itemCount: Col.length - 1,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        col_ind = index;
                                        color_stauts = true;
                                        Navigator.pop(context);
                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                            "😍😘😚👩‍🦰🎈💖"
                                            "Happy shayri"
                                            "😉🤗🤩😍❤",
                                            style: TextStyle(fontSize: 30)),
                                        decoration: BoxDecoration(
                                            gradient: LinearGradient(colors: [
                                          Col[index],
                                          Col[index + 1]
                                        ])),
                                      ),
                                    );},
                                ),
                              );},
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 70,
                          color: Colors.white,
                          child: Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage("myasset/expand.png"),
                              )),
                        )),
                    InkWell(
                        onTap: () {
                          Col.shuffle();
                          color_stauts = true;
                          setState(() {});
                        },
                        child: Container(
                          width: 70,
                          height: 40,
                          color: Colors.white,
                          child: Container(
                              height: 30,
                              width: 30,
                              child: Image(
                                image: AssetImage("myasset/reload.png"),
                              )),
                        ))],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: screen_height -
                                    status_bar -
                                    appbar_height -
                                    370,
                                child: Column(children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GridView.builder(
                                            itemCount: Col.length,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 8,
                                              mainAxisSpacing: 5,
                                              crossAxisSpacing: 5,
                                            ),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  c = Col[index];
                                                  color_stauts = false;
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 70,
                                                  color: Col[index],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        child: Image(
                                                            image: AssetImage(
                                                                "myasset/close.png")))),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ]),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 70,
                          color: Colors.red,
                          child: Text("Back-", style: TextStyle(fontSize: 20)),
                        )),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                barrierColor: Colors.transparent,
                                isScrollControlled: true,
                                isDismissible: false,
                                context: context,
                                builder: (context) {
                                  return Container(
                                    height: 100,
                                    child: Column(children: [
                                      Expanded(
                                        child: Row(children: [
                                          Expanded(
                                            child: GridView.builder(
                                              itemCount: Col.length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 8,
                                                mainAxisSpacing: 5,
                                                crossAxisSpacing: 5,
                                              ),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    pos1 = index;
                                                    text = true;
                                                    // c=Col[index];
                                                    // color_stauts = false;

                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    color: Col[index],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                          height: 30,
                                                          width: 30,
                                                          child: Image(
                                                              image: AssetImage(
                                                                  "myasset/close.png")))),
                                                ],
                                              )
                                            ],
                                          )
                                        ]),
                                      ),
                                    ]),
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 40,
                              width: 70,
                              color: Colors.red,
                              child: Text("Text_color",
                                  style: TextStyle(
                                    fontSize: 15,
                                  )),
                            )),
                      ],
                    ),
                    InkWell(
                        onTap: () async {
                          bytes = await controller.capture();
                          //create directory
                          var path = await ExternalPath
                                  .getExternalStoragePublicDirectory(
                                      ExternalPath.DIRECTORY_DOWNLOADS) +
                              "/ayushi";
                          print(path);
                          Directory dir = Directory(path);
                          if (!await dir.exists()) {
                            dir.create();
                          }
                          //create image
                          String imag_name =
                              "${Random().nextInt(1000)}myimage.jpg";
                          File file = File("${dir.path}/${imag_name}");
                          await file.writeAsBytes(bytes!);
                          Share.shareXFiles([XFile('${file.path}')],
                              text: 'Great picture');

                          // Share.shareFiles(['assets/math/p1.png'], text: 'Great picture');
                        },
                        child: Container(
                          height: 40,
                          width: 70,
                          color: Colors.red,
                          child: Text("Share", style: TextStyle(fontSize: 20)),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: Font.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            f1 = index;
                                            Font_stauts = true;
                                            setState(() {});
                                          },
                                          child: Container(
                                              alignment: Alignment.center,
                                              height: 40,
                                              width: 70,
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 20, 0, 20),
                                              color: Colors.pink,
                                              child: Text("Shayri",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          Font[index]))),
                                        );
                                      },
                                    )),
                                    InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          child: Image(
                                              image: AssetImage(
                                                  "myasset/close.png")),
                                        )),
                                  ]),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        color: Colors.red,
                        child: Text("Font-", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              barrierColor: Colors.transparent,
                              isDismissible: false,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 100,
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              child: Image(
                                                  image: AssetImage(
                                                      "myasset/close.png")),
                                            ))
                                      ],
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: data.emoji.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            child: ListTile(
                                              onTap: () {
                                                emoji = index;
                                                status = true;
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              title:
                                                  Text("${data.emoji[index]}"),
                                              tileColor: Colors.yellow,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ]),
                                );
                              },
                            );
                          },
                          child: Container(
                            height: 40,
                            width: 70,
                            color: Colors.red,
                            child:
                                Text("Emoji-", style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 100,
                              //  color: Colors.black,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: StatefulBuilder(
                                      builder: (context, setState1) {
                                        return Slider(
                                          activeColor: Colors.red,
                                          min: 0,
                                          max: 30,
                                          value: a,
                                          onChanged: (value) {
                                            a = value;
                                            setState(() {});
                                            setState1(() {});
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        child: Image(
                                            image: AssetImage(
                                                "myasset/close.png")),
                                      )),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: 40,
                        width: 70,
                        color: Colors.red,
                        child:
                            Text("Text Size-", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ],
                )
              ]),
            )
          ],
        ));
  }
}
