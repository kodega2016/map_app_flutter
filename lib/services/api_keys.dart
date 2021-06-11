class ApiKeys {
  final String key;

  ApiKeys({required this.key});

  factory ApiKeys.sandBox() {
    return ApiKeys(key: 'replace-your-keys-from-https://www.geoapify.com/');
  }
}
