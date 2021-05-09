# username_gen

## Random username generator

This is a simple package to create random usernames. To user it simply make these commands, ported from [Javascript](https://github.com/MaPhil/username-generator/)
l

```dart
import 'package:username_gen/username_gen.dart';

var username = UsernameGen.random(); // sharpened-whiskey87

 //OR

final username = UsernameGen().generate(); // sharpened-whiskey87

```

If you want to set an array of name (nouns) and or adjectives use these commands and also if you want to use a different seperator commands

```dart

import 'package:username_gen/username_gen.dart';

final username = UsernameGen.generateWith(
    data: UsernameGenData(
        names: ['new names'],
        adjectives: ['new adjectives'],
    ),
    seperator: '_'
); // pink-harmonica17

 //OR

final username = UsernameGen()
      ..setNames(['new names'])
      ..setSeperator('_')
      ..setAdjectives(['new adjectives'])
      ..generate(); // pink-harmonica17
      
```
