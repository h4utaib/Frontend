import 'package:flutter/material.dart';
import 'profiles.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Optional: Disables the debug banner
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.teal, // You can change this color if needed
      ),
      home: const LoginScreen(), // The first screen shown when the app starts
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
  final url = Uri.parse('http://localhost:3004/login'); // Replace with your backend URL
  
  // Prepare the data as a map
  final data = {
    'username': usernameController.text,
    'password': passwordController.text,
  };
  
  // Convert the data map into a JSON string
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(data), // Convert to JSON
  );

  if (response.statusCode == 200) {
    // Login successful
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Login Successful')),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => EditProfileScreen()), // Navigate to the profile screen
    );
  } else {
    // Handle errors
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${response.body}')),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login, // Call login function
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: const Text('Don\'t have an account? Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}