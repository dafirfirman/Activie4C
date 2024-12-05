import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'physical_fitness_page.dart'; // Import halaman Kebugaran Jasmani

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  // Fungsi untuk mendapatkan data username dari SharedPreferences
  Future<void> _getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'Pengguna';
    });
  }

  @override
  void initState() {
    super.initState();
    _getUserData(); // Mendapatkan data pengguna saat halaman dimuat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png', // Path logo
              width: 40,
              height: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, $username!', // Menampilkan nama pengguna
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigasi ke halaman PhysicalFitnessPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PhysicalFitnessPage(), // Panggil halaman
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.directions_run,
                        size: 40,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Kebugaran Jasmani',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


