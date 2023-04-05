import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final String tableNumber;

  MenuScreen({required this.tableNumber});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  List<String> _menuItems = [    'Pasta',    'Pizza',    'Burger',    'Sandwich',    'Salad',    'Fries',    'Chicken',    'Fish',    'Steak',    'Soup',  ];

  List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table ${widget.tableNumber} Menu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    title: Text(_menuItems[index]),
                    value: _selectedItems.contains(_menuItems[index]),
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          _selectedItems.add(_menuItems[index]);
                        } else {
                          _selectedItems.remove(_menuItems[index]);
                        }
                      });
                    },
                  );
                },
              ),
            ),
            ElevatedButton(
              child: Text('Submit Order'),
              onPressed: () {
                if (_selectedItems.length > 0) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Order Submitted!'),
                        content: Text(
                            'Your order for table ${widget.tableNumber} has been submitted with the following items: \n\n${_selectedItems.join('\n')}'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('No Items Selected'),
                        content: Text(
                            'Please select at least one item from the menu.'),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
