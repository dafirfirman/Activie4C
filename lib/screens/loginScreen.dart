import 'package:active4c/pages/home_page.dart';
import 'package:active4c/screens/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  // Fungsi untuk login
  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // Validasi input
    if (email.isEmpty || password.isEmpty) {
      _showMessage('Email dan password wajib diisi');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await http.post(
        Uri.parse('http://172.20.10.3/Active4C/api/api_login.php'), // URL API
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          _showMessage('Login berhasil!');

          // Simpan data ke SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('id', data['user']['id']);
          await prefs.setString('email', data['user']['email']);
          await prefs.setString('username', data['user']['username']);

          // Navigasi ke HomePage
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          _showMessage(data['message']);
        }
      } else {
        _showMessage('Terjadi kesalahan pada server. Kode: ${response.statusCode}');
      }
    } catch (e) {
      _showMessage('Gagal terhubung ke server: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Menampilkan pesan dengan SnackBar
  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Dekorasi kiri bawah
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              'assets/images/bottom.png', // Path untuk dekorasi bawah
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          // Dekorasi kiri atas
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/top.png', // Path untuk dekorasi atas
              width: MediaQuery.of(context).size.width * 0.9,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/logo.png'), // Path logo
                    ),
                    SizedBox(height: 30),

                    // Input Email
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      icon: Icons.email,
                    ),
                    SizedBox(height: 16),

                    // Input Password
                    _buildTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 10),

                    // Lupa Password dan Login + Icon More
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          // Lupa Password
                          TextButton(
                            onPressed: () {
                              _showMessage('Fitur lupa password belum tersedia');
                            },
                            child: Text(
                              'Lupa Password',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: _isLoading ? null : _login,
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8), // Jarak kecil antara teks Login dan panah
                              GestureDetector(
                                onTap: _isLoading ? null : _login,
                                child: Container(
                                  padding: EdgeInsets.all(12),
                                  child: Image.asset(
                                    'assets/images/iconmore.png', // Path untuk gambar panah
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),

                    // Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Belum memiliki akun? ',
                          style: TextStyle(fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk membuat field input
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
      ),
    );
  }
}
