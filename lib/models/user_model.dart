class UserModel {
  final int? id;
  final String nome;
  final String sobrenome;
  final String email;
  final String senha;

  UserModel(
      {this.id,
      required this.nome,
      required this.sobrenome,
      required this.email,
      required this.senha});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'senha': senha,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nome: map['nome'],
      sobrenome: map['sobrenome'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}
