enum Routes {
  initial('/'),
  navigation('/navigation'),
  login('/login'),
  register('/register'),
  verify('/verify'),
  profile('/profile'),
  settings('/settings'),
  update_password('/update_password'),
  fishList('/fish-list'),
  fishDetail('/fish-detail'),
  ;

  final String path;
  const Routes(this.path);
}
