import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;

class MultipleSelectionScreen extends StatefulWidget {
  const MultipleSelectionScreen({super.key});

  @override
  State<MultipleSelectionScreen> createState() =>
      _MultipleSelectionScreenState();
}

class _MultipleSelectionScreenState extends State<MultipleSelectionScreen> {
  List<Map<String, dynamic>> items = [
    {"id": 1, "title": "Apple"},
    {"id": 2, "title": "Banana"},
    {"id": 3, "title": "Kiwi"},
    {"id": 4, "title": "Pumpkin"},
    {"id": 5, "title": "Pineapple"},
    {"id": 6, "title": "Taro"},
    {"id": 7, "title": "Orange"},
    {"id": 8, "title": "Sugar Cane"},
  ];

  Set<int> selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Selection Demo'),
        centerTitle: true,
        backgroundColor: const Color(0xffF25244),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) => badge.Badge(
            showBadge: selectedItems.contains(items[index]['id']),
            badgeAnimation: const badge.BadgeAnimation.rotation(),
            position: badge.BadgePosition.topEnd(top: -10, end: -6),
            badgeContent:  Text(
              (selectedItems.toList().indexWhere((s) => s == items[index]['id']) + 1).toString(),
              style:const TextStyle(color: Colors.white),
            ),
            badgeStyle: const badge.BadgeStyle(padding: EdgeInsets.all(6)),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedItems.add(items[index]['id']);
                });
              },
              onDoubleTap: () {
                setState(() {
                  selectedItems.remove(items[index]['id']);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.1))
                    ]),
                child: Center(child: Text(items[index]['title'])),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
