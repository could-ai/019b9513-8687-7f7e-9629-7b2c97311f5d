import 'package:flutter/material.dart';

class GoalsAnalysisScreen extends StatefulWidget {
  const GoalsAnalysisScreen({super.key});

  @override
  State<GoalsAnalysisScreen> createState() => _GoalsAnalysisScreenState();
}

class _GoalsAnalysisScreenState extends State<GoalsAnalysisScreen> {
  String _goalAnalysis = 'Analisi gol non disponibile';
  Map<String, double> _goalDistribution = {};

  void _analyzeGoals() {
    // Mock goal analysis based on statistical data
    setState(() {
      _goalAnalysis = 'Previsione: Over 1.5 (85%), Under 2.5 (60%). Gol 1° tempo probabile.';
      _goalDistribution = {
        '0-15 min': 15.0,
        '16-30 min': 20.0,
        '31-45 min': 25.0,
        '46-60 min': 15.0,
        '61-75 min': 15.0,
        '76-90 min': 10.0,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analisi Gol')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Analisi Gol',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Analizza i gol per under/over, multigol, gol 1° e 2° tempo con distribuzione per archi temporali.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _analyzeGoals,
              child: const Text('Avvia Analisi Gol'),
            ),
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
            const Text('Risultati Analisi Gol', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(_goalAnalysis),
            const SizedBox(height: 20),
            const Text('Distribuzione Gol (%)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ..._goalDistribution.entries.map((entry) => 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(child: Text(entry.key)),
                    Text('${entry.value}%'),
                    const SizedBox(width: 10),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: entry.value / 100,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}