import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 24, 77, 115)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

final TextEditingController _nameController = TextEditingController();
String cityName = "Your City";
int Temp = 0;
String cityStatus = "No Status";

void _updateCityName() {
      setState(() {
        cityName = _nameController.text;
      });
    }

void _fetchWeather() {
  setState(() {
    Temp = Random().nextInt(30 - 15 + 1) + 15;
    _getStatus();
    _updateCityName();
  });
}

void _getStatus() {
  setState(() {
    if (Random().nextInt(3) + 1 == 3) {
      cityStatus = "Rainy";
    } 
    if (Random().nextInt(3) + 1 == 2){
      cityStatus = "Cloudy";
    }
    if (Random().nextInt(3) + 1 == 1) {
      cityStatus = "Sunny";
    }
  });
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Enter the name of the city!',
                border: OutlineInputBorder(),
            ),
            onSubmitted: (_) => _updateCityName(),
            ),

            SizedBox(height: 16.0),

              Column(
                children: [

            SizedBox(height: 8.0),
            Text(
            'Temperature: $Temp °C', // Display the status
            style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 8.0),
            Text(
            'Name: $cityName', // Display the status
            style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 8.0),
            Text(
            'Status: $cityStatus', // Display the status
            style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 16.0),
            ElevatedButton(
            onPressed: _fetchWeather,
            child: Text('Fetch Weather'),
            ),

          ],
        ),
          ]
        ),
      ),
    );
  }
}
