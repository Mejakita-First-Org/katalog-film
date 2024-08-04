import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:katalog_film/data/item_data.dart';
import 'package:katalog_film/data/login_data.dart';
import 'package:katalog_film/models/login_data.dart';
import 'package:katalog_film/widgets/bottomnavbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool kembali = false;

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Apakah anda yakin ingin Logout?'),
          actions: [
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Ya'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(selectedItem: 1),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showLogoutConfirmationDialog();
          if (kembali == true) {
            Navigator.pushNamed(context, '/');
            kembali = false;
          }
        },
        child: Icon(
          Icons.logout,
          color: Colors.red,
          size: 35,
        ),
        backgroundColor: const Color.fromARGB(255, 255, 136, 127),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/default_profile_icon.png',
                width: MediaQuery.of(context).size.width * .50,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LoginData().getUsername().toString(),
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      )),
    );
  }
}