import 'package:flutter/material.dart';
import 'network_service.dart';
import 'network_detail_page.dart';  

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CityBike Networks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BikeNetworksPage(),
    );
  }
}

class BikeNetworksPage extends StatefulWidget {
  @override
  _BikeNetworksPageState createState() => _BikeNetworksPageState();
}

class _BikeNetworksPageState extends State<BikeNetworksPage> {
  final NetworkService _networkService = NetworkService();
  late Future<List<dynamic>> _futureBikeNetworks;

  @override
  void initState() {
    super.initState();
    _futureBikeNetworks = _networkService.fetchBikeNetworks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CityBike Networks'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _futureBikeNetworks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final network = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  elevation: 4,
                  child: ListTile(
                    leading: Icon(Icons.directions_bike, color: Colors.blue),
                    title: Text(network['name'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(network['location']['city']),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NetworkDetailPage(network: network),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
