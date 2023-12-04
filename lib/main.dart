import 'package:flutter/material.dart';
import 'package:red_clue/pages/maps_page.dart';
import 'package:red_clue/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'RedClue'),
      routes: {
        '/mainpage': (context) => const MainPage(title: 'RedClue'),
        '/maps': (context) => const MapsPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final screens = [

  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        foregroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'NewRocker', fontSize: 26),
        ),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(12),
        crossAxisCount: 2,
        children: const <NavigationCard>[
          NavigationCard(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          NavigationCard(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          NavigationCard(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          NavigationCard(
            icon: Icon(Icons.paid),
            label: 'Donate',
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.inversePrimary,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Maps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list),
            label: 'Arsenal'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'More'
          ),
        ],
      ),
    );
  }
}

class NavigationCard extends StatelessWidget {
  const NavigationCard({super.key, required this.label, required this.icon});

  final Icon icon;
  final String label;
  // add navigation variable

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Column(
          children: [
            Icon(this.icon.icon),
            Text(this.label),
          ],
        ),
      ),
      // onTap: 
    );
  }
}