import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();

  bool _isLoading = false;

  // Fungsi untuk mengirim data registrasi ke API
  Future<void> _register() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    final username = _usernameController.text.trim();

    // Validasi input
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty || username.isEmpty) {
      _showMessage('Semua field wajib diisi');
      return;
    }

    if (password != confirmPassword) {
      _showMessage('Password dan konfirmasi password tidak cocok');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Kirim data ke API
      final response = await http.post(
        Uri.parse('http://172.20.10.3/Active4C/api/api_register.php'), // URL API
        body: {
          'username': username,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // Parsing respons JSON
        final data = jsonDecode(response.body);

        if (data['status'] == 'success') {
          _showMessage('Registrasi berhasil!');
          Navigator.pop(context); // Kembali ke halaman login
        } else {
          _showMessage(data['message']); // Tampilkan pesan dari API
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
              'assets/images/bottom.png',
              width: MediaQuery.of(context).size.width * 0.3,
              fit: BoxFit.cover,
            ),
          ),
          // Dekorasi kiri atas
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'assets/images/top.png',
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
                      backgroundImage: AssetImage('assets/images/logo.png'),
                    ),
                    SizedBox(height: 30),

                    // Input Username
                    _buildTextField(
                      controller: _usernameController,
                      hintText: 'Username',
                      icon: Icons.person,
                    ),
                    SizedBox(height: 16),

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
                    SizedBox(height: 16),

                    // Input Konfirmasi Password
                    _buildTextField(
                      controller: _confirmPasswordController,
                      hintText: 'Konfirmasi Password',
                      icon: Icons.lock_outline,
                      obscureText: true,
                    ),
                    SizedBox(height: 20),

                    // Tombol Register
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: _isLoading ? null : _register,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: _isLoading ? null : _register,
                            child: Container(
                              padding: EdgeInsets.all(12),
                              child: Image.asset(
                                'assets/images/iconmore.png',
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),

                    // Sudah punya akun? Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah punya akun? ',
                          style: TextStyle(fontSize: 14),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
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
