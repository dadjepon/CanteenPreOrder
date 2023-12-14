import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // For charts, add fl_chart to your pubspec.yaml

class NewDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Handle filter action
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Handle more options action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top stat cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard(title: 'Sales', value: '75', color: Colors.blue),
                _buildStatCard(title: 'Orders', value: '357', color: Colors.green),
                _buildStatCard(title: 'Visitors', value: '65', color: Colors.orange),
                _buildStatCard(title: 'Revenue', value: '\$128', color: Colors.red),
              ],
            ),
            // Pie Chart
            Card(
              margin: EdgeInsets.all(8.0),
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 40,
                      title: '40%',
                    ),
                    // Add other sections
                  ],
                ),
              ),
            ),
            // Line Chart
            Card(
              margin: EdgeInsets.all(8.0),
              child: LineChart(
                LineChartData(
                  // Line chart data
                ),
              ),
            ),
            // Revenue and Customer Map
            Row(
              children: [
                // Total Revenue
                Expanded(
                  child: Card(
                    // Use a time series chart
                  ),
                ),
                // Customer Map
                Expanded(
                  child: Card(
                    // Use a bar chart
                  ),
                ),
              ],
            ),
            // Customer Review
            Card(
              margin: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text('John Doe'),
                    subtitle: Text('Lorem ipsum dolor sit amet...'),
                    trailing: Icon(Icons.thumb_up, color: Colors.green),
                  ),
                  ListTile(
                    title: Text('Jane Smith'),
                    subtitle: Text('Consectetur adipiscing elit...'),
                    trailing: Icon(Icons.thumb_down, color: Colors.red),
                  ),
                  // Add more reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({required String title, required String value, required Color color}) {
    return Card(
      color: color,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
