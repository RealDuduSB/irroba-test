class User {
  final String username; // Nome de usuário do usuário.
  final String token; // Token de autenticação do usuário.

  /// Construtor da classe User.
  User({
    required this.username, // Nome de usuário, obrigatório.
    required this.token, // Token de autenticação, obrigatório.
  });
}
