
import 'package:flutter/material.dart';

class HamburguerMenu extends StatelessWidget {
  final Function(String) onCategoriaSelecionada;

  const HamburguerMenu({
    super.key,
    required this.onCategoriaSelecionada,
  });

  @override
  Widget build(BuildContext context) {
    final categorias = [
      'segunda',
      'terça',
      'quarta',
      'quinta',
      'sexta',
      'Todos',
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Monitores DCOMP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ),
          ),

          ...categorias.map((categoria) {
            return ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(categoria),
              onTap: () {
                onCategoriaSelecionada(categoria);
                Navigator.pop(context);
              },
            );
          }),
        ],
      ),
    );
  }
}
