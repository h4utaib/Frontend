import 'package:flutter/material.dart';
import 'Register_Vehicles.dart';
import 'Register_Estate.dart';
import 'Register_Valuable.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register Assets',
      theme: ThemeData(
        primaryColor: const Color(0xFF00BF6D),
      ),
      home: const RegisterAssetsPage(),
    );
  }
}

class RegisterAssetsPage extends StatelessWidget {
  const RegisterAssetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: const Color(0xFF00BF6D),
        foregroundColor: Colors.white,
        title: const Text("Register Assets"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  _buildAssetOption(
                    context: context,
                    imagePath:
                        'https://png.pngtree.com/element_our/sm/20180516/sm_5afbf1d28feb1.jpg',
                    title: "Vehicle",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterVehicleScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildAssetOption(
                    context: context,
                    imagePath:
                        'https://png.pngtree.com/template/20190217/ourmid/pngtree-real-estate-logohome-logohouse-logosimple-design-image_56618.jpg',
                    title: "Property",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterEstateScreen(),
                        ),

                      );
                      // Navigate to property registration
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildAssetOption(
                    context: context,
                    imagePath:
                        'https://cdn-icons-png.flaticon.com/512/6757/6757061.png',
                    title: "Valuables",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterValuableScreen(), 
                          ),
                      );
                      // Navigate to valuables registration
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Register action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00BF6D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAssetOption({
    required BuildContext context,
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color(0xFF00BF6D).withOpacity(0.05),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color(0xFF00BF6D), width: 1),
        ),
        child: Row(
          children: [
            imagePath.startsWith('http')
                ? Image.network(
                    imagePath,
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    imagePath,
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 20),
          ],
        ),
      ),
    );
  }
}