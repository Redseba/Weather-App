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
List<Map<String, dynamic>> Forecast = [];

void _updateCityName() {
      setState(() {
        cityName = _nameController.text;
      });
    }

void _fetchWeather() {
  setState(() {
    Temp = Random().nextInt(30 - 15 + 1) + 15;
    cityStatus = _getStatus();
    _updateCityName();
  });
}

void _fetchForecast() {
    setState(() {
      Forecast = List.generate(7, (index) {
        int sDayTemp = Random().nextInt(30 - 15 + 1) + 15; // Random temperature
        String dayStatus = _getStatus(); // Get random weather status
        return {
          'day': 'Day ${index + 1}',
          'temp': sDayTemp,
          'status': dayStatus,
        };
      });
    });
  }

String _getStatus() {
  int integer = Random().nextInt(3);
  if (integer == 0) {
    return "Sunny";
  } else if (integer == 1) {
    return "Cloudy";
  } else {
    return "Rainy";
  }
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

            ElevatedButton(
            onPressed: _fetchForecast,
            child: Text('Fetch 7-Day Forecast'),
            ),

            if (Forecast.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: Forecast.map((forecast) {
                      return Container(
                        width: 100,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(forecast['day'], style: TextStyle(fontSize: 18)),
                                Text('Temp: ${forecast['temp']} °C'),
                                Text('Status: ${forecast['status']}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
          ],
        ),
          ]
        ),
      ),
    );
  }
}
