import 'package:flutter/material.dart';
import '../models/habito.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habito> habitos = [];
  bool carregando = true;

  @override
  void initState() {
    super.initState();
    carregarHabitos();
  }

  Future<void> carregarHabitos() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      habitos = [
        Habito('Beber água', 'Preciso tomar água'),
        Habito('Estudar', 'Matemática'),
        Habito('Academia', 'Puxar ferro'),
      ];
      carregando = false;
    });
  }

  void toggleHabito(int index, bool? valor) {
    setState(() {
      habitos[index].concluido = valor ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int concluidos = habitos.where((h) => h.concluido).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Hábitos'),
        backgroundColor: const Color.fromARGB(255, 136, 127, 189),
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Total: ${habitos.length} | Concluídos: $concluidos',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: habitos.length,
                    itemBuilder: (context, index) {
                      final habito = habitos[index];

                      return Card(
                        color: habito.concluido
                            ? Colors.green[100]
                            : Colors.white,
                        child: ListTile(
                          title: Text(
                            habito.nome,
                            style: TextStyle(
                              decoration: habito.concluido
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          trailing: Checkbox(
                            value: habito.concluido,
                            onChanged: (valor) =>
                                toggleHabito(index, valor),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.detalhes,
                              arguments: habito,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}