import 'package:flutter/material.dart';
import '../../models/AyatSour_model.dart';

class AyatScreen extends StatelessWidget {
  final AyatSour surah;

  AyatScreen({required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(surah.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            surah.displayqoran,
            style: TextStyle(fontSize: 18, height: 1.5),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
