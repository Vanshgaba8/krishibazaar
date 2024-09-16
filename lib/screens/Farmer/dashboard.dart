import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> options = [
    {'icon': Icons.history, 'label': 'Past Orders'},
    {'icon': Icons.report_problem, 'label': 'Complaints'},
    {'icon': Icons.local_shipping, 'label': 'Track Order'},
    {'icon': Icons.analytics, 'label': 'Profit Analytics'},
    {'icon': Icons.shopping_cart, 'label': 'Current Orders'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hello, Mayank",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle edit profile action
                },
                child: Row(
                  children: [
                    Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Icon(Icons.edit, color: Colors.blue),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.0), // Spacing between header and grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                return GestureDetector(
                  onTap: () {
                    // Handle navigation to respective screen
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[800]!.withOpacity(0.2),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(option['icon'], size: 48.0, color: Colors.brown),
                        SizedBox(height: 8.0),
                        Text(
                          option['label'],
                          style: TextStyle(
                            color: Colors.brown,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
