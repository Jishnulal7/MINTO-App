import 'package:flutter/material.dart';
import 'package:milo/screens/menu.dart';
import 'package:milo/utils/routes.dart';

class TableSelectionScreen extends StatefulWidget {
  const TableSelectionScreen({super.key});

  @override
  _TableSelectionScreenState createState() => _TableSelectionScreenState();
}

class _TableSelectionScreenState extends State<TableSelectionScreen> {
  List<dynamic> tables = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
    'Table 6',
    'Table 7',
    'Table 8',
    'Table 9',
    'Table 10'
  ];

  List<bool> isTableOccupied = [
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false
  ];

  bool orderCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text('Table Selection'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemCount: tables.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (!isTableOccupied[index]) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MenuScreen(tableNumber: (index + 1).toString()),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('This table is occupied!'),
                  ),
                );
              }

            },
            child: Card(
              color: isTableOccupied[index] ? Colors.red : Colors.green,
              child: ListTile(
                title: Text(tables[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
