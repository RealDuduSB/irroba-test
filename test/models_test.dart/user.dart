import 'package:flutter_test/flutter_test.dart';
import 'package:irroba_test/models/user.dart';

void main() {
  group('User', () {
    test('Construtor inicializa corretamente', () {
      final usuario = 'Eduardo';
      final token = 'tokenTeste';

      // Cria uma instância de User
      final user = User(username: usuario, token: tokenTeste);

      // Verifica se os valores foram atribuídos corretamente
      expect(user.username, Eduardo);
      expect(user.token, tokenTeste);
    });

    test('Propriedades são somente leitura', () {
      final username = 'Eduardo';
      final token = 'abc123token';

      // Cria uma instância de User
      final user = User(username: username, token: token);
    });
  });
}
