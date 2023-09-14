import 'package:flutter_riverpod/flutter_riverpod.dart';

class RivUser {
  final String name;
  final int age;

//<editor-fold desc="Data Methods">
  const RivUser({
    required this.name,
    required this.age,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RivUser &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age);

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  @override
  String toString() {
    return 'RivUser{ name: $name, age: $age,}';
  }

  RivUser copyWith({
    String? name,
    int? age,
  }) {
    if ((name == null || identical(name, this.name)) &&
        (age == null || identical(age, this.age))) {
      return this;
    }

    return RivUser(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap({
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return {
      keyMapper('name'): name,
      keyMapper('age'): age,
    };
  }

  factory RivUser.fromMap(
    Map<String, dynamic> map, {
    String Function(String key)? keyMapper,
  }) {
    keyMapper ??= (key) => key;

    return RivUser(
      name: map[keyMapper('name')] as String,
      age: map[keyMapper('age')] as int,
    );
  }

//</editor-fold>
}



class RivUserNotifier extends StateNotifier<RivUser> {
  RivUserNotifier(super.state);
  void updateName(String jina){
    state= state.copyWith(name: jina);
  }
  void updateUser(RivUser rivUser){
    state= state.copyWith(
        name: rivUser.name,
        age: rivUser.age);
  }
}
