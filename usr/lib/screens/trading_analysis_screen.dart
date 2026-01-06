import 'package:flutter/material.dart';

class TradingAnalysisScreen extends StatefulWidget {
  const TradingAnalysisScreen({super.key});

  @override
  State<TradingAnalysisScreen> createState() => _TradingAnalysisScreenState();
}

class _TradingAnalysisScreenState extends State<TradingAnalysisScreen> {
  String _tradingStrategy = 'Strategia non disponibile';
  List<String> _strategies = [];

  void _analyzeTrading() {
    // Mock trading analysis for betting exchange
    setState(() {
      _tradingStrategy = 'Strategia raccomandata: Banca X per match ad alto rischio';
      _strategies = [
        'Pre-match: Banca la sfavorita con lay odds',
        'Live: Punta gol successivo dopo 0-0 al 60°',
        'Risultato esatto: 2-1 (lay 15.0, back 12.0)',
        'Consiglio: Monitora movimento quote in tempo reale',
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analisi Trading')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Analisi Trading',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Analisi per strategie di betting exchange: banca X, banca sfavorita, banca risultato esatto, punta gol successivo.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _analyzeTrading,
              child: const Text('Avvia Analisi Trading'),
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
            const Text('Strategia Principale', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(_tradingStrategy),
            const SizedBox(height: 20),
            const Text('Strategie Dettagliate', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ..._strategies.map((strategy) => 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green, size: 20),
                    const SizedBox(width: 10),
                    Expanded(child: Text(strategy)),
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