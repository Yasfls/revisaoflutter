class Habito {
  final String nome;
  final String descricao;
  bool concluido;

  Habito(
    this.nome,
    this.descricao, {
    this.concluido = false,
  });
}