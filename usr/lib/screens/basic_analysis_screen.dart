import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' if (dart.library.html) 'dart:html';

class BasicAnalysisScreen extends StatefulWidget {
  const BasicAnalysisScreen({super.key});

  @override
  State<BasicAnalysisScreen> createState() => _BasicAnalysisScreenState();
}

class _BasicAnalysisScreenState extends State<BasicAnalysisScreen> {
  String _teams = 'Squadre non rilevate';
  String _odds = 'Quote non rilevate';
  String _analysis = 'Analisi non disponibile';

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // Mock OCR - in real app, this would use AI/ML to extract text
      setState(() {
        _teams = 'Juventus vs Inter';
        _odds = '1: 2.10, X: 3.20, 2: 3.50';
        _analysis = 'Consiglio: Over 2.5 (1.85) - Alta probabilità basata sui dati statistici';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analisi Base')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Analisi Base',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Carica uno screenshot da diretta.it o inserisci manualmente i dati per analisi base: esito finale, over/under, entrambe segnano.'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo),
              label: const Text('Seleziona Screenshot dalla Galleria'),
            ),
            const SizedBox(height: 20),
            _buildManualInput(),
            const SizedBox(height: 20),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildManualInput() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Inserimento Manuale', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(decoration: const InputDecoration(labelText: 'Squadra Casa')),
            TextField(decoration: const InputDecoration(labelText: 'Squadra Trasferta')),
            TextField(decoration: const InputDecoration(labelText: 'Quota 1')),
            TextField(decoration: const InputDecoration(labelText: 'Quota X')),
            TextField(decoration: const InputDecoration(labelText: 'Quota 2')),
            TextField(decoration: const InputDecoration(labelText: 'Quota Over 2.5')),
            TextField(decoration: const InputDecoration(labelText: 'Quota Under 2.5')),
            TextField(decoration: const InputDecoration(labelText: 'Entrambe Segnano Sì/No')),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => setState(() => _analysis = 'Analisi mock: Consigliato Over 2.5'),
              child: const Text('Analizza'),
            ),
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
            const Text('Risultati Analisi', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Squadre: $_teams'),
            Text('Quote: $_odds'),
            const SizedBox(height: 10),
            Text('Analisi IA: $_analysis'),
          ],
        ),
      ),
    );
  }
}