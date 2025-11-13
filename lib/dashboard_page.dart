import 'package:flutter/material.dart';
import 'biodata_page.dart';
import 'kontak_page.dart';
import 'kalkulator_page.dart';
import 'cuaca_page.dart';
import 'berita_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  String _title = "Biodata"; // Judul awal

  // Daftar halaman
  static const List<Widget> _widgetOptions = <Widget>[
    BiodataPage(),
    KontakPage(),
    KalkulatorPage(),
    CuacaPage(),
    BeritaPage(),
  ];

  // Daftar judul untuk AppBar
  static const List<String> _appBarTitles = [
    "Biodata",
    "Kontak",
    "Kalkulator",
    "Cuaca",
    "Berita",
  ];

  // Daftar ikon untuk tiap halaman
  IconData _getPageIcon(int index) {
    switch (index) {
      case 0:
        return Icons.person;
      case 1:
        return Icons.contacts;
      case 2:
        return Icons.calculate;
      case 3:
        return Icons.wb_sunny;
      case 4:
        return Icons.article;
      default:
        return Icons.home;
    }
  }

  // Daftar warna gradasi untuk tiap halaman
  List<List<Color>> _gradientColors = const [
    [Color(0xFF4A90E2), Color(0xFF6C63FF)], // Biodata
    [Color(0xFF36D1DC), Color(0xFF5B86E5)], // Kontak
    [Color(0xFFFFA726), Color(0xFFFF7043)], // Kalkulator
    [Color(0xFF74ABE2), Color(0xFF5583EE)], // Cuaca
    [Color(0xFF9C27B0), Color(0xFFE040FB)], // Berita
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _title = _appBarTitles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan tampilan modern
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _gradientColors[_selectedIndex],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    _getPageIcon(_selectedIndex),
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Biodata',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Kontak',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Kalkulator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Cuaca',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Berita',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
