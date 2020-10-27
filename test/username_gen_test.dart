import 'package:test/test.dart';
import 'package:username_gen/username_gen.dart';

void main() {
  test('.gen() & .generate() values are not', () {
    final username = UsernameGen();
    final user = UsernameGen.gen();
    print(user);
    expect(user, isNotNull, reason: 'Username generated cannot be null');
    expect(username.data, isNotNull, reason: 'UsernameGenData cannot be null');
    expect(username.generate(), isNotNull,
        reason: 'Username generated cannot be null');
    expect(username.seperator, equals('-'));
  });
  test('.setNames() & .setAdjectives give Correct values', () {
    final username = UsernameGen()
      ..setNames(['names'])
      ..setAdjectives(['adjectives']);

    expect(username.generate().split('-'), contains('adjectives'),
        reason: 'Username generated contains names & adjectives');
  });
}
