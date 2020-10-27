import 'dart:math';

import 'raw.dart';

abstract class UsernameGenImpl {
  /// Allocates a list of names for the specified `UsernameGen`.
  void setNames(List<String> _names);

  /// Allocates a list of adjectives for the specified `UsernameGen`.
  void setAdjectives(List<String> _adjectives);

  /// If you want to use a different seperator commands. Default separator is `-`
  void setSeperator(String new_seperator);

  /// Generates a random user name
  ///
  ///     UsernameGen.gen(); // communicative-accountant-31
  ///
  /// OR
  ///
  ///     UsernameGen()
  ///     ..setSeperator('_')
  ///     ..generate(); // emotional_lambert_65
  ///
  String generate();
}

class UsernameGen implements UsernameGenImpl {
  var seperator = '-';
  var data = UsernameGenData(
    names: names,
    adjectives: adjectives,
  );

  @override
  void setNames(_names) {
    data.names = _names;
  }

  @override
  void setAdjectives(_adjectives) {
    data.adjectives = _adjectives;
  }

  @override
  void setSeperator(String new_seperator) {
    seperator = new_seperator;
  }

  @override
  String generate() {
    final ran_a = (Random().nextDouble() * data.names.length).floor();
    final ran_b = (Random().nextDouble() * data.adjectives.length).floor();
    final ran_suffix = (Random().nextDouble() * 100).floor();
    return "${data.adjectives[ran_b]}${seperator}${data.names[ran_a]}${ran_suffix}";
  }

  static String gen({UsernameGenData data, String seperator = '-'}) {
    data ??= UsernameGenData(
      names: names,
      adjectives: adjectives,
    );

    final ran_a = (Random().nextDouble() * data.names.length).floor();
    final ran_b = (Random().nextDouble() * data.adjectives.length).floor();
    final ran_suffix = (Random().nextDouble() * 100).floor();
    return "${data.adjectives[ran_b]}${seperator}${data.names[ran_a]}${ran_suffix}";
  }
}

class UsernameGenData {
  List<String> names;
  List<String> adjectives;

  UsernameGenData({
     this.names,
     this.adjectives,
  });
}
