import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
String cityStatus = "Rainy";

void _updateCityName() {
    setState(() {
      cityName = _nameController.text.isNotEmpty ? _nameController.text : "Your City";
    });
  }
void _fetchWeather() {
  setState(() {
    Temp = 15;
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

            SizedBox(height: 8.0),
            Text(
            'Status: $Temp', // Display the status
            style: TextStyle(fontSize: 20.0),
            ),

            SizedBox(height: 8.0),
            Text(
            'Status: $cityName', // Display the status
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
      ),
    );
  }
}
