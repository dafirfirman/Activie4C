import 'package:flutter/material.dart';

class FourCCompetenciesPage extends StatelessWidget {
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
          '4C Kompetensi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Judul Utama
            Text(
              'Apa Itu 4C Kompetensi?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),

            // Penjelasan
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  '4C Kompetensi adalah serangkaian keterampilan abad ke-21 yang terdiri dari:\n\n'
                  '1. **Critical Thinking**: Kemampuan berpikir kritis untuk menganalisis situasi, mengevaluasi informasi, dan memecahkan masalah secara logis.\n\n'
                  '2. **Creativity**: Kemampuan untuk berpikir kreatif dalam menghasilkan ide-ide baru, inovasi, dan solusi yang tidak konvensional.\n\n'
                  '3. **Collaboration**: Kemampuan untuk bekerja sama dalam tim dengan efektif, saling mendukung, dan berkomunikasi secara produktif.\n\n'
                  '4. **Communication**: Kemampuan untuk menyampaikan ide, informasi, dan pesan secara jelas baik secara lisan maupun tulisan.\n\n'
                  'Kompetensi ini penting dalam dunia modern untuk mendukung kesuksesan individu dalam lingkungan kerja maupun kehidupan sehari-hari.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
