class District {
  final String id;
  final String? pid;
  final int level;
  final String name;
  final String fullname;

  const District({required this.id, this.pid, required this.level, required this.name, required this.fullname});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is District &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          pid == other.pid &&
          level == other.level &&
          name == other.name &&
          fullname == other.fullname;

  @override
  int get hashCode => id.hashCode ^ pid.hashCode ^ level.hashCode ^ name.hashCode ^ fullname.hashCode;

  @override
  String toString() {
    return 'District{id: $id, pid: $pid, level: $level, name: $name, fullname: $fullname}';
  }
}
