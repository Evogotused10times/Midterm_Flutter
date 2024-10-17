import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CastanaresEvo_MidtermExam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> items = [
    {'name': 'Pader', 'isAdded': false},
    {'name': 'Mader', 'isAdded': false},
    {'name': 'Dog', 'isAdded': false},
    {'name': 'Cat', 'isAdded': false},
    {'name': 'Tree', 'isAdded': false},
    {'name': 'Flappy', 'isAdded': false},
    {'name': 'Bird', 'isAdded': false},
    {'name': 'Angry', 'isAdded': false},
    {'name': 'Potato', 'isAdded': false},
    {'name': 'Cheese', 'isAdded': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CastanaresEvo_MidtermExam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemCard(
                    item: items[index],
                    onDetails: () {
                      print("Mao ni ang sulod sa ${items[index]['name']}");
                    },
                    onAdd: () {
                      setState(() {
                        items[index]['isAdded'] = true;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onDetails;
  final VoidCallback onAdd;

  const ItemCard({
    required this.item,
    required this.onDetails,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: item['isAdded'] ? Colors.greenAccent : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(item['name'], style: TextStyle(fontSize: 18)),
            ),
            ElevatedButton(
              onPressed: onDetails,
              child: Text('Details'),
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: item['isAdded'] ? null : onAdd,
              child: item['isAdded'] ? Text('Added') : Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
