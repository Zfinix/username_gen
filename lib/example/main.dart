import 'package:username_gen/username_gen.dart';

main() {
  var username = UsernameGen.gen();
  print(username);

  //OR

  final username2 = UsernameGen().generate();
  print(username2);
}
