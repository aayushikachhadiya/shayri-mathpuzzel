import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: first(),
  ));
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  bool h1 = false;
  bool h2 = false;
  bool h3 = false;
  int city = 1;
  int city1 = 1;
  int city2 = 1;
  int sum = 0;
  List a1 = [
    "COMPUTRE 20000",
  ];
  List a2 = ["AC  50000"];
  List a3 = ["TV  70000"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: h1,
                onChanged: (value) {
                  h1 = value!;
                  if (h1 == true) {
                    sum += 20000;
                  } else {
                    sum -= 20000;
                  }
                  // a1.add(sum);
                  setState(() {});
                },
              ),
              Text(
                "COMPUTER",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "20000",
                style: TextStyle(fontSize: 30),
              ),
              Container(
                child: DropdownButton(
                  value: city,
                  items: [
                    DropdownMenuItem(
                      child: Text("1"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("2"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("3"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("4"),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text("5"),
                      value: 5,
                    ),
                  ],
                  onChanged: (value) {
                    city = value!;
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: h2,
                onChanged: (value) {
                  h2 = value!;
                  if (h2 == true) {
                    sum += 50000;
                  } else {
                    sum -= 50000;
                  }
                  setState(() {});
                },
              ),
              Text(
                "AC",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "50000",
                style: TextStyle(fontSize: 30),
              ),
              Container(
                child: DropdownButton(
                  value: city1,
                  items: [
                    DropdownMenuItem(
                      child: Text("1"),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text("2"),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text("3"),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text("4"),
                      value: 4,
                    ),
                    DropdownMenuItem(
                      child: Text("5"),
                      value: 5,
                    )
                  ],
                  onChanged: (value) {
                    city1 = value!;
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                value: h3,
                onChanged: (value) {
                  h3 = value!;
                  if (h3 == true) {
                    sum += 70000;
                  } else {
                    sum -= 70000;
                  }
                  setState(() {});
                },
              ),
              Text(
                "TV",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "70000",
                style: TextStyle(fontSize: 30),
              ),
              DropdownButton(
                value: city2,
                items: [
                  DropdownMenuItem(
                    child: Text("1"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("2"),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Text("3"),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Text("4"),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Text("5"),
                    value: 5,
                  ),
                ],
                onChanged: (value) {
                  city2 = value!;
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: a1.length+a2.length+a3.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child:
                               ListTile(
                                  title: (h1 == true ||
                                          h2 == true ||
                                          h3 == true)
                                      ? Text(
                                          "${(h1 == true) ? a1[index] : "${null}"} ${(h2 == true) ? a2[index] : "${null}"}  ${(h3 == true) ? a3[index] : "${null}"}")
                                      : null,
                                  tileColor: Colors.pink,
                                )
                        );
                      },
                    )),
              )
            ],
          ),
          // Column(children: [
          //   Row(children: [
          //     ListView.builder(itemCount: 3,itemBuilder: (context, index) {
          //       return Card(
          //         child: ListTile(
          //           title: Text("${sum}"),
          //         ),
          //       );
          //     },)
          //   ],)
          // ],)
        ],
      ),
    );
  }
}
