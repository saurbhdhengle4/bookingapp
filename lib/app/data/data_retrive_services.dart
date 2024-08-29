class DataRetriever {
  final Map<String, dynamic> data;

  DataRetriever(this.data);

  int getInt(String key) {
    return data[key] as int? ?? 0;
  }

  List<T> getList<T>(String key) {
    return data[key] as List<T>? ?? [];
  }

  Map<K, V> getMap<K, V>(String key) {
    return data[key] as Map<K, V>? ?? {};
  }

  String getString(String key) {
    return data[key] as String? ?? '';
  }
}
