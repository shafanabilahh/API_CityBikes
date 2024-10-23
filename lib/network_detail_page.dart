import 'package:flutter/material.dart';

class NetworkDetailPage extends StatelessWidget {
  final dynamic network;

  const NetworkDetailPage({Key? key, required this.network}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(network['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/bike2.png',
              ),
            ),
            SizedBox(height: 20),  
            Text('Network Name: ${network['name']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('City: ${network['location']['city']}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('Country: ${network['location']['country']}',
                style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
