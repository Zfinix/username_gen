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
  ///     UsernameGen.random(); // communicative-accountant-31
  ///
  /// OR
  ///
  ///     UsernameGen()
  ///     ..setSeperator('_')
  ///     ..generate(); // emotional_lambert_65
  ///
  String random();
}

class UsernameGen {
  var seperator = '-';

  UsernameGenData data = UsernameGenData(
    names: names,
    adjectives: adjectives,
  );

  void setNames(_names) {
    data.names = _names;
  }

  void setAdjectives(_adjectives) {
    data.adjectives = _adjectives;
  }

  void setSeperator(String new_seperator) {
    seperator = new_seperator;
  }

  static String generateWith({UsernameGenData? data, String seperator = '-'}) {
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

extension RandomUsernameGen on UsernameGen {
  String generate() {
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
    required this.names,
    required this.adjectives,
  });

  UsernameGenData copyWith({
    List<String>? names,
    List<String>? adjectives,
  }) {
    return UsernameGenData(
      names: names ?? this.names,
      adjectives: adjectives ?? this.adjectives,
    );
  }
}
