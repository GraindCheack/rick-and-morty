enum NetworkMode {
  local._('Offline'),
  api._('Online');

  const NetworkMode._(this.name);
  final String name;
}
