import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Centrale'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Analisi Partite di Calcio',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildMenuCard(
                    context,
                    'Analisi Base',
                    Icons.sports_soccer,
                    '/basic-analysis',
                    'Analisi esito finale, over/under, entrambe segnano',
                  ),
                  _buildMenuCard(
                    context,
                    'Analisi Avanzata',
                    Icons.analytics,
                    '/advanced-analysis',
                    'Interpretazione dati asiatici da screenshot',
                  ),
                  _buildMenuCard(
                    context,
                    'Analisi Gol',
                    Icons.sports_score,
                    '/goals-analysis',
                    'Distribuzione gol per tempi e archi temporali',
                  ),
                  _buildMenuCard(
                    context,
                    'Analisi Trading',
                    Icons.trending_up,
                    '/trading-analysis',
                    'Strategie per betting exchange pre-match e live',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Nota: Alcune funzionalità richiedono abbonamento (da implementare dopo test)',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, String title, IconData icon, String route, String description) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).primaryColor),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(description, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}