
import 'package:flutter/material.dart';
import '../Model/monitoresModel.dart';

class DetalheMonitorView extends StatelessWidget {
  final monitoresModel monitor;
  final List<monitoresModel> todosMonitores;
  final String categoriaOrigem;

   const DetalheMonitorView({
    Key? key,
    required monitoresModel monitor,
    required List<monitoresModel> todosMonitores,
    required String categoriaOrigem,
  })  : monitor = monitor,
        todosMonitores = todosMonitores,
        categoriaOrigem = categoriaOrigem,
        super(key: key);//identificador de cada card

  @override
  Widget build(BuildContext context) {
    final pegarMonitorEspecifico = todosMonitores.where((item) {
      return item.nome == monitor.nome &&
          (categoriaOrigem == 'Todos' ||
              item.semana == categoriaOrigem);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(monitor.nome),
      ),
      body: pegarMonitorEspecifico.isEmpty
          ? const Center(
              child: Text('Nenhum horário encontrado :c'),
            )
          : ListView.builder(
              itemCount: pegarMonitorEspecifico.length,
              itemBuilder: (context, index) {
                final item = pegarMonitorEspecifico[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: const Icon(Icons.access_time),
                    title: Text(item.semana),
                    subtitle: Text('Horário: ${item.horario}'),
                  ),
                );
              },
            ),
    );
  }
}
