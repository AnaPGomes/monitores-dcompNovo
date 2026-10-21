
import 'package:flutter/material.dart';
import '../Model/monitoresModel.dart';
import '../ViewModel/monitoresViewModel.dart';

class DetalheMonitorView extends StatelessWidget {
  final monitoresModel monitor;
  final List<monitoresModel> todosMonitores;
  final String categoriaOrigem;

  const DetalheMonitorView({
    Key? key,
    required this.monitor,
    required this.todosMonitores,
    required this.categoriaOrigem,
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    final viewModel = monitoresViewModel();

    final pegarMonitorEspecifico = viewModel.horariosDoMonitor(
      todosMonitores,
      monitor,
      categoriaOrigem,
    );

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
