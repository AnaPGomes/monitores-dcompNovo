
import 'package:flutter/material.dart';
import 'HamburguerMenu.dart';
import '../Model/monitoresModel.dart';
import '../ViewModel/monitoresViewModel.dart';
import 'detalheMonitorView.dart';

class MonitorView extends StatefulWidget {
  const MonitorView({super.key});

  @override
  State<MonitorView> createState() => _MonitorViewState();
}

class _MonitorViewState extends State<MonitorView> {
  final viewModel = monitoresViewModel();

  List<monitoresModel> monitores = [];
  String? categoria;
  String? erro;

  Future<void> carregarMonitores(String dia) async {
    try {
      final lista = await viewModel.qualidadeDosDados(dia);

      setState(() {
        monitores = lista;
        categoria = dia;
        erro = null;
      });
    } catch (e) {
      setState(() => erro = 'Erro ao carregar: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Monitores')),
      drawer: HamburguerMenu(
        onCategoriaSelecionada: carregarMonitores,
      ),
      body: erro != null
          ? Center(child: Text(erro!))
          : categoria == null
              ? const Center(child: Text('Escolha um dia no menu'))
              : monitores.isEmpty
                  ? const Center(child: Text('Nenhum monitor encontrado'))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: monitores.length,
                      itemBuilder: (context, index) {
                        final monitor = monitores[index];

                        return SizedBox(
                          width: 180,
                          child: Card(
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text(monitor.nome),
                              subtitle: Text(
                                '${monitor.horario}\n${monitor.semana}',
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetalheMonitorView(
                                      monitor: monitor,
                                      todosMonitores:
                                          viewModel.listaDeMonitores,
                                      categoriaOrigem: categoria!,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
