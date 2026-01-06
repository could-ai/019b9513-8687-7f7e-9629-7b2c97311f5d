import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AdvancedAnalysisScreen extends StatefulWidget {
  const AdvancedAnalysisScreen({super.key});

  @override
  State<AdvancedAnalysisScreen> createState() => _AdvancedAnalysisScreenState();
}

class _AdvancedAnalysisScreenState extends State<AdvancedAnalysisScreen> {
  String _asianData = 'Dati asiatici non rilevati';
  String _advancedAnalysis = 'Analisi avanzata non disponibile';

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Mock OCR for Asian handicap data
      setState(() {
        _asianData = 'Handicap: Juventus -0.5 (1.90), Inter +0.5 (1.95)';
        _advancedAnalysis = 'Basato sui dati asiatici e configurazioni: Alta probabilità di pareggio o vittoria Inter. Consigliato Inter +0.5';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analisi Avanzata')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Analisi Avanzata',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Carica uno screenshot da asianbetsoccer.com per interpretare i dati asiatici e configurazioni avanzate.'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo),
              label: const Text('Seleziona Screenshot Asian')),
            const SizedBox(height: 20),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildResults() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Dati Asiatici Estratti', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(_asianData),
            const SizedBox(height: 20),
            const Text('Analisi Avanzata IA', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(_advancedAnalysis),
          ],
        ),
      ),
    );
  }
}