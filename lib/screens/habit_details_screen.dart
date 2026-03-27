import 'package:flutter/material.dart';
import '../models/habito.dart';

class HabitDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Habito habito =
        ModalRoute.of(context)!.settings.arguments as Habito;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Hábito'),
        backgroundColor: const Color.fromARGB(255, 136, 127, 189),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              habito.nome,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              habito.descricao,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Concluído: '),
                Checkbox(
                  value: habito.concluido,
                  onChanged: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}