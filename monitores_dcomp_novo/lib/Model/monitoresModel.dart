class monitoresModel{

  String nome;
  String horario;
  String semana;

  monitoresModel(
    {
  required this.nome,
  required this.horario,
  required this.semana
}
);

factory monitoresModel.TransfromandoemOBJ(Map<String, dynamic> jsonPassado) {
     return monitoresModel(
      nome: jsonPassado['nome'],
      horario: jsonPassado['horario'],
      semana: jsonPassado["semana"]
    );
  }

}