
import 'dart:convert';
import 'package:flutter/services.dart';
import '../Model/monitoresModel.dart';

class monitoresViewModel {
    
    List<monitoresModel> listaDeMonitores = [];

    Future<List<monitoresModel>> qualidadeDosDados(String categoria) async {

            String dadosdoJsonString = await rootBundle.loadString('lib/Arquivos.json');

            Map<String, dynamic> json = jsonDecode(dadosdoJsonString);

            List<dynamic> dados = json['monitores'];
            
               listaDeMonitores = dados.map<monitoresModel>((item) {
                    return monitoresModel.TransfromandoemOBJ(
                        Map<String, dynamic>.from(item)
                    );
                }).toList();

            if (listaDeMonitores.isEmpty) {
                print("Os dados nao carregaram, sentimos muito :c");
            }

            if (categoria == "Todos") {
                return listaDeMonitores;
            }

            List<monitoresModel> monitoresFiltrados =
                listaDeMonitores.where((monitor) {
                    return monitor.semana == categoria;
                }).toList();

            return monitoresFiltrados;
    }
}
