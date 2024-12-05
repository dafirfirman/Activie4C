import 'package:flutter/material.dart';

class UnderstandingPage extends StatelessWidget {
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
          'Pengertian Kebugaran Jasmani',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: [
              TextSpan(
                text:
                    'Kebugaran jasmani adalah kemampuan tubuh seseorang untuk melakukan aktivitas fisik sehari-hari secara efektif tanpa mengalami kelelahan yang berlebihan, serta masih memiliki cadangan energi untuk menikmati waktu luang dan menghadapi situasi darurat. Kebugaran jasmani mencakup berbagai aspek, termasuk kekuatan otot, daya tahan, fleksibilitas, kecepatan, koordinasi, dan keseimbangan. Kondisi ini sangat dipengaruhi oleh pola hidup sehat, seperti olahraga teratur, pola makan seimbang, istirahat yang cukup, serta kemampuan untuk mengelola stres.\n\n',
              ),
              TextSpan(
                text:
                    'Tujuan utama kebugaran jasmani adalah menjaga kesehatan tubuh secara menyeluruh, meningkatkan produktivitas, dan mencegah berbagai penyakit yang berhubungan dengan gaya hidup, seperti obesitas, diabetes, dan penyakit jantung.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
