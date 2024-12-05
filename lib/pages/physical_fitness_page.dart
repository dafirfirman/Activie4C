import 'package:active4c/pages/4C_competencies_page.dart';
import 'package:active4c/pages/animation_page.dart';
import 'package:active4c/pages/element_page.dart';
import 'package:active4c/pages/notes_page.dart';
import 'package:active4c/pages/quiz_page.dart';
import 'package:flutter/material.dart';
import 'understanding_page.dart'; // Import halaman Pengertian

class PhysicalFitnessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Kebugaran Jasmani',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          children: [
            // Pengertian Kebugaran Jasmani
            _buildMenuCard(
              context,
              icon: Icons.lightbulb_outline,
              title: 'Pengertian Kebugaran Jasmani',
              onTap: () {
                // Navigasi ke halaman Pengertian
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UnderstandingPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            // Unsur-Unsur Kebugaran Jasmani
            _buildMenuCard(
              context,
              icon: Icons.accessibility_new_outlined,
              title: 'Unsur-Unsur Kebugaran Jasmani',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ElementPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            // Video Animasi 3D dan Teks AUDIO
            _buildMenuCard(
              context,
              icon: Icons.video_library_outlined,
              title: 'Video Animasi 3D dan Teks AUDIO',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimationPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            // 4C Kompetensi
            _buildMenuCard(
              context,
              icon: Icons.layers_outlined,
              title: '4C Kompetensi',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FourCCompetenciesPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            // Kuis
            _buildMenuCard(
              context,
              icon: Icons.quiz_outlined,
              title: 'Kuis',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            // Catatan
            _buildMenuCard(
              context,
              icon: Icons.note_alt,
              title: 'Catatan',
              backgroundColor: Colors.purple,
              textColor: Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotesPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membuat kotak menu dengan radius
  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color backgroundColor = Colors.yellow,
    Color textColor = Colors.black,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // Shadow posisi
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          children: [
            Icon(icon, color: textColor, size: 28),
            SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
