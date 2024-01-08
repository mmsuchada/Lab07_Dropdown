import 'package:flutter/material.dart';

class MyFirst extends StatefulWidget {
  const MyFirst({super.key, required String title});

  @override
  State<MyFirst> createState() => _MyFirstState();
}

class _MyFirstState extends State<MyFirst> {

  List<ListItem> foodType =[
    ListItem("Yum", "ยำ"),
    ListItem("TomYum", "ต้มยำ"),
    ListItem("JanDeaw", "จานเดียว"),
    ListItem("SomTam", "ส้มตำ"),
  ];
  List<DropdownMenuItem<ListItem>> _dropdownMenuItems = [];

  ListItem? _selectedItem;

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
    List<ListItem> foodType) {

      List<DropdownMenuItem<ListItem>> items = [];

      for (ListItem ft in foodType) {
        items.add(
          DropdownMenuItem(
            value: ft,
            child: Text(ft.name),
            ),
            );
      }
      return items;

    }

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItem(foodType);
    _selectedItem = _dropdownMenuItems[0].value;
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(
    appBar: AppBar(
      title: const Text("Lab07 Dropdown"),
    ),

    body: Column(children: [
      Text("้เลือกประเภทอาหาร"),
      DropdownButton(
        value: _selectedItem,
        items: _dropdownMenuItems, 
        onChanged: (value){
          setState(() {
            _selectedItem = value!;
          });
        },
        ),
        Divider()
    ],),
  );    
  }
}

class ListItem {
  String value;
  String name;

  ListItem(this.value, this.name);

}