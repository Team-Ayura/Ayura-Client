class Init {
  static Future initialize() async {
    await _registerServices();
    await _loadSettings();
  }

  static _registerServices() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  static _loadSettings() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
