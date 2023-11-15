import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}
  class _MyAppState extends State<MyApp> {
  final List<Map<String,dynamic>>fruits =[
    {'name' : "Appel",'image':"",'status': false},
    {'name' : "Anggur",'image': "",'status': false},
    {'name' : "Pepaya",'image':"",'status' : false},
    {'name' : "Pisang",'image':"",'status' :false},
  ];

  bool areAllFruitSelected(){
    for(final fruit in fruits){
      if(!fruit['status']){
        return false;
      }
    }
    return true;
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      appBar: AppBar(title: Text("Map List View"), centerTitle: true),
        body: Column(
          children: <widget>[
            areAllFruitSelected()?Text("Anda Memilih Semuanya"):SizedBox(),
            Expanded(
                child: ListView(
                  children: fruits.map((fruit){
                    return ListTile(
                      title: Text(fruit['name']),
                      leading: Icon(Icons.favorite, color: fruit["status"]!? Colors.amber :Colors.grey),
                      shape: Border(bottom: BorderSide(color: Colors.amber)),
                      onTap: (){
                        fruit["status"] = !fruit["status"];
                        });
                  },
                );
  }).toList(),
  ),
  ),
          ],
        ),
      ),
  );
  }
}
