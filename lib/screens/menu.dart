import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  final String tableNumber;

  const MenuScreen({super.key, required this.tableNumber});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final List<String> _menuItems = [
    'Broast',
    'Pizza',
    'Burger',
    'Sandwich',
    'Porotta',
    'Chicken Curry',
    'Beef',
    'Fries',
    'Chicken Chilli',
    'Fried Chicken',
    'Mandhi',
    'Shawarma',
    'Biriyani'
  ];
  final List<String> _menuPrice = [
    '₹399',
    '₹299',
    '₹99',
    '₹40',
    '₹10',
    '₹110',
    '₹100',
    '₹99',
    '₹150',
    '₹399',
    '₹499',
    '₹399',
    '₹99',
    '₹199',
  ];

  final List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Table ${widget.tableNumber} Menu'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    subtitle: Text(_menuPrice[index]),
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
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
              child: const Text(
                'Submit Order',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (_selectedItems.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Order Submitted!'),
                        content: Text(
                          'Your order for table ${widget.tableNumber} has been submitted with the following items: \n\n${_selectedItems.join('\n')}',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
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
                        title: const Text('No Items Selected'),
                        content: const Text(
                            'Please select at least one item from the menu.'),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.pop(context, true);
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
