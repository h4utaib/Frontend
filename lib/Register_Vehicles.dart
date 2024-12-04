import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterVehicleScreen extends StatelessWidget {
  const RegisterVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Vehicle',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.teal.shade100,
                  child: Icon(
                    Icons.car_rental,
                    size: 50,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Register Your Vehicle',
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('Vehicle Type'),
              const SizedBox(height: 15),
              _buildTextField('License Plate Number'),
              const SizedBox(height: 15),
              _buildTextField('Make and Model'),
              const SizedBox(height: 15),
              _buildTextField('Color'),
              const SizedBox(height: 15),
              _buildTextField('Chassis Number'),
              const SizedBox(height: 15),
              _buildTextField('Owner Name'),
              const SizedBox(height: 15),
              _buildTextField('Vehicle Description', maxLines: 4),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Add vehicle registration logic here
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Register Vehicle',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.poppins(color: Colors.teal),
        filled: true,
        fillColor: Colors.teal.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
      style: GoogleFonts.poppins(color: Colors.teal.shade900),
    );
  }
}